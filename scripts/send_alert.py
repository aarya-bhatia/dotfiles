import smtplib, ssl
import os
from dotenv import load_dotenv

load_dotenv()

sender_name = "Alert Service"
sender_email = "aaryab.alertservice@gmail.com"
receiver_name = "Aarya Bhatia"
receiver_email = "aarya.bhatia1678@gmail.com"

host="smtp.gmail.com"
port = 465
password = os.getenv('GOOGLE_APP_PASSWORD')

message = ""
message += f"From: {sender_name} <{sender_email}>\n"
message += f"To: {receiver_name} <{receiver_email}>\n"
message += "Subject: [ALERT] SMTP Test Email\n"
message += "\n"
message += "This is a test e-mail message. Do not reply to this email.\n"

context = ssl.create_default_context()

with smtplib.SMTP_SSL(host, port, context=context) as server:
    server.login(sender_email, password)
    server.sendmail(sender_email, receiver_email, message)
    print ("Successfully sent email")

