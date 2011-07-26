pid = Process.fork { … código ruby … }

Process.wait pid    # esperar PID
Process.waitall     # esperar todos los hijos