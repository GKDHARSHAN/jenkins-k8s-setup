# Use the official Python image as the base
FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy only the necessary files first to leverage Docker caching
COPY requirements.txt /app/

# Install dependencies before copying the entire project
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application files
COPY . /app/

# Ensure static files are collected (optional, for production)
RUN python manage.py collectstatic --noinput

# Expose the port your Django app runs on
EXPOSE 8000

# Command to start the Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
