# Project Phase2 By Group 1 

ใช้เว็บนี้ในการทดสอบ Retailsy http://45.144.164.182:8080/

![enter image description here](https://img5.pic.in.th/file/secure-sv1/sss8.png)

## System Testing

จะเป็นการนำ Search products , Order products , Add to cart มาเขียน Test 

- Search product จะเป็นการเทสค้นหาชื่อสินค้าว่าจะหาเจอไหม แต่ถ้าเราใส่ชื่อผิดจะหาไม่เจอ

- Order product เป็นการเทสการสั่งสินค้าและจะมีการใส่ที่อยุ่ในการสั่งสินค้าในขั้นตอนนี้ 

- Add to cart เป็นการเทสในส่วนของการกดสินค้าเข้าสู่รถเข็น

หมายเหตุ ขั้นตอนแบบละเอียดจะอยู่ใน file System Testing


## Automated UI Testing
 - Test1 ทำการ Test Search ข้อมูลว่าผลลัพธ์ที่ได้ต้องมีการใกล้เคียงกับสิ่งที่ค้นหาโดยเช็คว่า ชื่อของ Title ต้องตรงกับ สิ่งที่คาดหวังไว้
 ![enter image description here](https://img2.pic.in.th/pic/Test1.png)
 - Test2 ทำการ Test Search ชื่อสินค้าและทาการเพิ่มเข้าตะกร้าและสุดท้ายคือการยืนยันคาสั่งซื้อ ทาการเช็คว่าระบบได้นาทางมาถูกหน้าหรือไม่เมื่อทาการกด Placeorderแล้ว
![enter image description here](https://img2.pic.in.th/pic/Test2.png)
 - Test3 ทำการ Test Search ชื่อสินค้าและทาการเพิ่มเข้าตะกร้าและทดสอบเพิ่มสินค้าอีกชิ้นว่าได้ถูกเพิ่มอย่างถูกต้องหรือไม่
![enter image description here](https://img5.pic.in.th/file/secure-sv1/Test3.png)

## Performance testing

 - Average-load test การทดสอบประสิทธิภาพของระบบหรือแอปพลิเคชันในสภาวะที่มีการให้บริการ

![enter image description here](https://img5.pic.in.th/file/secure-sv1/avg11.png)
 - Stress testing การทดสอบความสามารถของระบบหรือแอปพลิเคชันในเงื่อนไขที่กดดันหรือในสภาวะที่มีการใช้ทรัพยากรมากเกินไป เพื่อทดสอบว่าระบบสามารถทำงานได้ถูกต้องและประสิทธิภาพมีความเสถียรในเวลาที่มีการให้บริการที่มีภาระการใช้งานสูง
 enter image description here

 - Soak testing การทดสอบระบบหรือแอปพลิเคชันในระยะเวลาที่ยาวนาน ในเงื่อนไขการให้บริการปกติ เพื่อตรวจสอบว่าระบบสามารถทำงานได้เสถียรตลอดเวลาที่มีการให้บริการ
![enter image description here](https://img2.pic.in.th/pic/Soak.png)
 - Spike testing การทดสอบประสิทธิภาพของระบบหรือแอปพลิเคชันเมื่อมีการเพิ่มขึ้นอย่างรวดเร็วในการใช้ทรัพยากรหรือจำนวนผู้ใช้ ซึ่งทดสอบการจัดการกับการกระโดดขึ้นและลงของภาระการใช้งานในระบบ
![enter image description here](https://img2.pic.in.th/pic/sp.png)
