FROM python:3.11-slim

WORKDIR /app

# Instalar dependências do sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copiar requirements e instalar Python packages
COPY requirements.txt .

# Instalar pacotes Python
RUN pip install --upgrade pip
RUN pip install \
    jupyter \
    pandas \
    matplotlib \
    seaborn \
    psycopg2-binary \
    sqlalchemy \
    ipykernel

# Verificar instalações
RUN python -c "import pandas; print('Pandas version:', pandas.__version__)"
RUN python -c "import matplotlib; print('Matplotlib version:', matplotlib.__version__)"
RUN python -c "import seaborn; print('Seaborn version:', seaborn.__version__)"
RUN python -c "import sqlalchemy; print('SQLAlchemy version:', sqlalchemy.__version__)"
RUN python -c "import psycopg2; print('Psycopg2 version:', psycopg2.__version__)"

# Expor porta do Jupyter
EXPOSE 8888

# Comando para manter o container rodando
CMD ["tail", "-f", "/dev/null"]