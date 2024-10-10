# Obtener la dirección IP y la puerta de enlace predeterminada
$ipInfo = Get-NetIPConfiguration | Where-Object { $_.IPv4DefaultGateway -ne $null }
$ipAddress = $ipInfo.IPv4Address.IPAddress
$gateway = $ipInfo.IPv4DefaultGateway.NextHop
# Obtener el nombre del equipo y el dominio
$computerName = $env:COMPUTERNAME
$domainName = $env:USERDNSDOMAIN
# Crear el mensaje que se va a mostrar
$message = @"
IP Address: $ipAddress
Default Gateway: $gateway
Computer Name: $computerName
Domain Name: $domainName
"@
# Mostrar el mensaje en una ventana emergente
[System.Windows.MessageBox]::Show($message, "Información del equipo")