"""
Database Mapping Script

This script helps map the existing PHP MySQL database tables to Django models.
It reads the database structure and generates a report showing field mappings 
between the MySQL schema and Django models.

Usage:
1. Ensure your database settings are correct in settings.py
2. Run: python database_mapping.py
3. Review the output report and adjust models as needed
"""

import os
import sys
import django
from django.db import connections, models
from collections import defaultdict
import json

# Add the project path to sys.path
project_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.append(project_path)

# Set up Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'keralatechreach.settings')
django.setup()

# Import models after Django setup
from api.models import (
    AppVersion,
    CategoryModel,
    BudgetSelection,
    ContactMessage,
    SliderItem,
    ApprovedQuestion,
    Product
)
from admindashboard.models import (
    QuestionPaper,
    University,
    Degree,
    Exam,
    Job,
    District,
    Initiative,
    EventCategory,
    Event,
    News,
    Gallery,
    EntranceNotification
)

DJANGO_MODELS = [
    AppVersion,
    CategoryModel,
    BudgetSelection,
    ContactMessage,
    SliderItem,
    ApprovedQuestion,
    Product,
    QuestionPaper,
    University,
    Degree,
    Exam,
    Job,
    District,
    Initiative,
    EventCategory,
    Event,
    News,
    Gallery,
    EntranceNotification
]

# MySQL to Django field type mapping
MYSQL_TO_DJANGO = {
    'int': models.IntegerField,
    'bigint': models.BigIntegerField,
    'tinyint': models.BooleanField,
    'smallint': models.SmallIntegerField,
    'mediumint': models.IntegerField,
    'varchar': models.CharField,
    'text': models.TextField,
    'longtext': models.TextField,
    'mediumtext': models.TextField,
    'decimal': models.DecimalField,
    'float': models.FloatField,
    'double': models.FloatField,
    'datetime': models.DateTimeField,
    'date': models.DateField,
    'time': models.TimeField,
    'timestamp': models.DateTimeField,
    'enum': models.CharField,
    'blob': models.BinaryField,
    'longblob': models.BinaryField
}

def get_mysql_tables():
    """Get all tables from the MySQL database"""
    with connections['default'].cursor() as cursor:
        cursor.execute("SHOW TABLES")
        tables = cursor.fetchall()
        return [table[0] for table in tables]

def get_table_columns(table_name):
    """Get all columns for a table"""
    with connections['default'].cursor() as cursor:
        cursor.execute(f"DESCRIBE `{table_name}`")
        columns = cursor.fetchall()
        return columns

def get_django_model_for_table(table_name):
    """Try to find the Django model for a given table name"""
    for model in DJANGO_MODELS:
        # Check standard name or with _set suffix (for reverse relations)
        if model._meta.db_table == table_name or f"{model._meta.db_table}_set" == table_name:
            return model
    return None

def get_field_type_mapping(mysql_type):
    """Convert MySQL field type to Django field type"""
    # Extract base type (remove length and other attributes)
    base_type = mysql_type.split('(')[0].lower()
    return MYSQL_TO_DJANGO.get(base_type, models.TextField).__name__

def analyze_database_mapping():
    """Analyze mapping between MySQL tables and Django models"""
    tables = get_mysql_tables()
    mapping_report = {
        'mapped_tables': [],
        'unmapped_tables': [],
        'field_mappings': defaultdict(list),
        'missing_fields': defaultdict(list),
        'extra_fields': defaultdict(list)
    }
    
    for table_name in tables:
        model = get_django_model_for_table(table_name)
        if model:
            mapping_report['mapped_tables'].append(table_name)
            
            # Get MySQL columns
            mysql_columns = get_table_columns(table_name)
            mysql_column_names = [col[0] for col in mysql_columns]
            mysql_column_types = {col[0]: col[1] for col in mysql_columns}
            
            # Get Django fields
            django_fields = model._meta.get_fields()
            django_field_names = [field.name for field in django_fields 
                                 if not field.is_relation or field.concrete]
            
            # Check field mappings
            for mysql_col, mysql_type in mysql_column_types.items():
                expected_django_type = get_field_type_mapping(mysql_type)
                
                if mysql_col in django_field_names:
                    mapping_report['field_mappings'][table_name].append({
                        'mysql_column': mysql_col,
                        'mysql_type': mysql_type,
                        'django_field': mysql_col,
                        'expected_django_type': expected_django_type
                    })
                else:
                    mapping_report['missing_fields'][table_name].append({
                        'mysql_column': mysql_col,
                        'mysql_type': mysql_type,
                        'expected_django_type': expected_django_type
                    })
            
            # Check for extra fields in Django models
            for django_field in django_field_names:
                if django_field not in mysql_column_names and not django_field.endswith('_id'):
                    mapping_report['extra_fields'][table_name].append(django_field)
        else:
            mapping_report['unmapped_tables'].append(table_name)
    
    return mapping_report

def generate_report(mapping_data):
    """Generate a human-readable report"""
    report = []
    report.append("# Database Mapping Report")
    report.append("\n## Summary")
    report.append(f"Total MySQL tables: {len(mapping_data['mapped_tables']) + len(mapping_data['unmapped_tables'])}")
    report.append(f"Mapped tables: {len(mapping_data['mapped_tables'])}")
    report.append(f"Unmapped tables: {len(mapping_data['unmapped_tables'])}")
    
    report.append("\n## Mapped Tables")
    for table in mapping_data['mapped_tables']:
        report.append(f"- {table}")
    
    report.append("\n## Unmapped Tables")
    for table in mapping_data['unmapped_tables']:
        report.append(f"- {table}")
    
    report.append("\n## Field Mappings")
    for table, fields in mapping_data['field_mappings'].items():
        report.append(f"\n### {table}")
        report.append("| MySQL Column | MySQL Type | Django Field | Expected Django Type |")
        report.append("|-------------|------------|--------------|---------------------|")
        for field in fields:
            report.append(f"| {field['mysql_column']} | {field['mysql_type']} | {field['django_field']} | {field['expected_django_type']} |")
    
    report.append("\n## Missing Fields")
    for table, fields in mapping_data['missing_fields'].items():
        if fields:
            report.append(f"\n### {table}")
            report.append("| MySQL Column | MySQL Type | Expected Django Type |")
            report.append("|-------------|------------|---------------------|")
            for field in fields:
                report.append(f"| {field['mysql_column']} | {field['mysql_type']} | {field['expected_django_type']} |")
    
    report.append("\n## Extra Fields")
    for table, fields in mapping_data['extra_fields'].items():
        if fields:
            report.append(f"\n### {table}")
            for field in fields:
                report.append(f"- {field}")
    
    return "\n".join(report)

if __name__ == "__main__":
    print("Analyzing database mapping...")
    mapping_data = analyze_database_mapping()
    
    # Generate and write report
    report = generate_report(mapping_data)
    with open('database_mapping_report.md', 'w') as f:
        f.write(report)
    
    # Also save the raw data as JSON for further processing
    with open('database_mapping_data.json', 'w') as f:
        json.dump(mapping_data, f, indent=2, default=str)
    
    print(f"Report generated: database_mapping_report.md")
    print(f"Raw data saved: database_mapping_data.json") 