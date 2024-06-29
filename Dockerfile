# Usa una imagen base de Python
FROM python:3.9-slim

# Instala las bibliotecas de AWS que necesites
# Por ejemplo, para AWS SDK para Python (Boto3)
RUN pip install boto3

# Instala Git y otras herramientas si es necesario
RUN apt-get update && apt-get install -y git

# Define el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo requirements.txt al directorio de trabajo en el contenedor
COPY requirements.txt .

# Instala las dependencias de tu aplicación
RUN pip install -r requirements.txt

# Verifica si el directorio de la aplicación ya existe antes de clonar desde GitHub
RUN test -d /app/docker_aws || git clone https://github.com/alejandrabeltranm/docker_aws.git /app/docker_aws

# Comando por defecto para ejecutar cuando se inicie el contenedor
CMD ["python", "app.py"]
