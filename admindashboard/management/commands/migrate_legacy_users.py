import os
import time
from django.core.management.base import BaseCommand
from django.utils import timezone
from django.db import transaction
from keralatechreach.auth_utils import migrate_legacy_user, migrate_all_users
from keralatechreach.models import User as LegacyUser
from django.contrib.auth.models import User
from admindashboard.models import UserProfile
import logging

logger = logging.getLogger(__name__)

class Command(BaseCommand):
    help = 'Migrate users from legacy PHP system to Django authentication system'
    
    def add_arguments(self, parser):
        parser.add_argument(
            '--user-id',
            type=int,
            help='Migrate a specific user by legacy ID',
        )
        parser.add_argument(
            '--username',
            type=str,
            help='Migrate a specific user by legacy username',
        )
        parser.add_argument(
            '--all',
            action='store_true',
            help='Migrate all users',
        )
        parser.add_argument(
            '--reset-password',
            type=str,
            help='Reset password for all migrated users to this value',
        )
        parser.add_argument(
            '--dry-run',
            action='store_true',
            help='Only show what would be migrated without actually migrating',
        )
    
    def handle(self, *args, **options):
        start_time = time.time()
        self.stdout.write('Starting user migration...')
        
        user_id = options.get('user_id')
        username = options.get('username')
        migrate_all_flag = options.get('all')
        reset_password = options.get('reset_password')
        dry_run = options.get('dry_run')
        
        if dry_run:
            self.stdout.write(self.style.WARNING('DRY RUN MODE - No changes will be made'))
        
        total_legacy_users = LegacyUser.objects.count()
        self.stdout.write(f'Total legacy users found: {total_legacy_users}')
        
        if user_id:
            # Migrate a single user by ID
            try:
                legacy_user = LegacyUser.objects.get(id=user_id)
                self.stdout.write(f'Found legacy user: {legacy_user.userid} (ID: {legacy_user.id})')
                
                if dry_run:
                    self.stdout.write(f'Would migrate user {legacy_user.userid} (ID: {legacy_user.id})')
                else:
                    user = migrate_legacy_user(legacy_user.id, reset_password)
                    if user:
                        self.stdout.write(self.style.SUCCESS(
                            f'Successfully migrated user: {legacy_user.userid} -> {user.username}'
                        ))
                    else:
                        self.stdout.write(self.style.ERROR(
                            f'Failed to migrate user: {legacy_user.userid}'
                        ))
            except LegacyUser.DoesNotExist:
                self.stdout.write(self.style.ERROR(f'User with ID {user_id} not found in legacy system'))
        
        elif username:
            # Migrate a single user by username
            try:
                legacy_user = LegacyUser.objects.get(userid=username)
                self.stdout.write(f'Found legacy user: {legacy_user.userid} (ID: {legacy_user.id})')
                
                if dry_run:
                    self.stdout.write(f'Would migrate user {legacy_user.userid} (ID: {legacy_user.id})')
                else:
                    user = migrate_legacy_user(legacy_user.id, reset_password)
                    if user:
                        self.stdout.write(self.style.SUCCESS(
                            f'Successfully migrated user: {legacy_user.userid} -> {user.username}'
                        ))
                    else:
                        self.stdout.write(self.style.ERROR(
                            f'Failed to migrate user: {legacy_user.userid}'
                        ))
            except LegacyUser.DoesNotExist:
                self.stdout.write(self.style.ERROR(f'User with username {username} not found in legacy system'))
        
        elif migrate_all_flag:
            # Migrate all users
            self.stdout.write(f'Migrating all users ({total_legacy_users})...')
            
            if dry_run:
                for legacy_user in LegacyUser.objects.all():
                    self.stdout.write(f'Would migrate user {legacy_user.userid} (ID: {legacy_user.id})')
                self.stdout.write(self.style.SUCCESS(f'Would migrate {total_legacy_users} users'))
            else:
                success_count, fail_count, error_details = migrate_all_users(reset_password)
                
                self.stdout.write(self.style.SUCCESS(
                    f'Migration complete: {success_count} users migrated successfully, {fail_count} failed'
                ))
                
                if fail_count > 0:
                    self.stdout.write(self.style.WARNING('Failed migrations:'))
                    for error in error_details:
                        self.stdout.write(f'  - {error}')
        
        else:
            # No specific action specified
            self.stdout.write(self.style.WARNING(
                'No action specified. Use --user-id, --username, or --all to migrate users'
            ))
            self.stdout.write('Legacy users in the system:')
            for legacy_user in LegacyUser.objects.all()[:10]:  # Show first 10 only
                self.stdout.write(f'  - {legacy_user.userid} (ID: {legacy_user.id})')
            
            if total_legacy_users > 10:
                self.stdout.write(f'  ... and {total_legacy_users - 10} more')
        
        end_time = time.time()
        elapsed_time = end_time - start_time
        self.stdout.write(f'User migration process completed in {elapsed_time:.2f} seconds') 