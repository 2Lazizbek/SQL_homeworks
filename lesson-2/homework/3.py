import pyodbc

conn = pyodbc.connect(
    'DRIVER={SQL Server};'
    'SERVER=BEAST;'
    'DATABASE=lesson2;'
    'Trusted_Connection=yes;'
)

cursor = conn.cursor()

cursor.execute("select image_data from photos where id = 1")
image_data = cursor.fetchone()[0]

with open('C:\\Users\\lazer_007\\Downloads\\apple2.jpg', 'wb') as file:
    file.write(image_data)

conn.close()

print("Image saved as apple2.jpg")