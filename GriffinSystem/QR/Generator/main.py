from ensurepip import version
import qrcode

primary_color = "#1f1f1f"
secondary_color = "white"

print("Choose an ID prefix: ")
prefix = input()


def generate_code(value):
    #FUNCTION TO GENERATE QRCODE

    #styling the qrcode
    qr_style = qrcode.QRCode(version = 1, box_size = 40, border = 3)
    qr_style.add_data(value)
    qr_style.make(fit = True)

    #generating the image and saving it
    key_img = qr_style.make_image(fill_color = primary_color, back_color = secondary_color)#qrcode.make(admno)
    key_img.save(f"qrcodes/{value}.png")
    
print("Input the first number: ")
start_no = int(input())

print("Input the final number: ")
final_no = int(input())

for i in range(start_no, final_no + 1):
    generate_code(f"{prefix}{i}")
