FROM python:3.11

# Create user
RUN useradd -m -u 1000 user

# Set working directory
WORKDIR /home/user/app

# Create necessary directories with correct permissions
RUN mkdir -p /home/user/app/public
RUN mkdir -p /home/user/app/logs
RUN chown -R user:user /home/user/app

# Copy requirements first
COPY --chown=user requirements.txt .
RUN pip install -r requirements.txt

# Copy the rest of the application
COPY --chown=user . .

# Document that the container listens on port 7860
EXPOSE 8080

# Set user
USER user

# Command to run the application
CMD ["chainlit", "run", "app.py", "--host", "0.0.0.0", "--port", "8080", "-h"]
