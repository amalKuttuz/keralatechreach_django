import psutil
import os
from datetime import datetime

def get_memory_info():
    # Get virtual memory details
    vm = psutil.virtual_memory()
    swap = psutil.swap_memory()
    
    print("\n=== MEMORY USAGE ANALYSIS ===")
    print(f"Total RAM: {vm.total / (1024**3):.2f} GB")
    print(f"Available: {vm.available / (1024**3):.2f} GB")
    print(f"Used: {vm.used / (1024**3):.2f} GB ({vm.percent}%)")
    print(f"Free: {vm.free / (1024**3):.2f} GB")
    print(f"Cached: {vm.cached / (1024**3):.2f} GB")
    print(f"\nSwap Used: {swap.used / (1024**3):.2f} GB ({swap.percent}%)")
    
    print("\n=== TOP MEMORY PROCESSES ===")
    # Get processes sorted by memory usage
    processes = []
    for proc in psutil.process_iter(['pid', 'name', 'memory_percent', 'cpu_percent']):
        try:
            pinfo = proc.info
            pinfo['memory_mb'] = proc.memory_info().rss / (1024 * 1024)  # Convert to MB
            processes.append(pinfo)
        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
            pass
    
    # Sort by memory usage and print top 10
    processes.sort(key=lambda x: x['memory_mb'], reverse=True)
    print("\nTop 10 Memory-Intensive Processes:")
    print(f"{'PID':<8} {'Memory (MB)':<12} {'CPU %':<8} Process")
    print("-" * 50)
    for proc in processes[:10]:
        print(f"{proc['pid']:<8} {proc['memory_mb']:<12.2f} {proc['cpu_percent']:<8.1f} {proc['name']}")

    # Calculate total Python process memory
    python_processes = [p for p in processes if 'python' in p['name'].lower()]
    total_python_memory = sum(p['memory_mb'] for p in python_processes)
    print(f"\nTotal Python Processes Memory: {total_python_memory:.2f} MB")
    
    print("\n=== MEMORY USAGE OVER TIME ===")
    # Get memory usage trend (last 5 minutes if available)
    try:
        from admindashboard.monitoring.models import SystemMetrics
        from django.utils import timezone
        from datetime import timedelta
        
        five_mins_ago = timezone.now() - timedelta(minutes=5)
        metrics = SystemMetrics.objects.filter(timestamp__gte=five_mins_ago).order_by('timestamp')
        
        if metrics.exists():
            print("\nMemory Usage Trend (Last 5 minutes):")
            for metric in metrics:
                print(f"{metric.timestamp.strftime('%H:%M:%S')}: {metric.memory_usage:.1f}%")
    except Exception as e:
        print("Could not fetch historical metrics:", str(e))

if __name__ == "__main__":
    get_memory_info() 