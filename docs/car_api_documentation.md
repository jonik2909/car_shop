# 🚗 Car API Documentation

Bu hujjatda Car API ning barcha endpointlari haqida to'liq ma'lumot berilgan.

---

## API Endpoints

<details>
<summary><strong>1. GET /car/all - Barcha avtomobillar ro'yxatini olish</strong></summary>

### Tavsif

Barcha avtomobillar ro'yxatini olish.

### So'rov

- Metod: `GET`
- Body: yo'q

### Javob

```json
[
  {
    "_id": "68474c6df2a20e1d1088bcc7",
    "carTitle": "BMW M5",
    "carDesc": "The BMW M5 Sedan is a high-performance sports car with elite equipment options and racetrack-ready technical specs",
    "carPrice": 123000,
    "carImage": "uploads/cars/2d8b5d30-2e10-4853-a862-c96a2d239878.jpg",
    "createdAt": "2025-06-09T21:04:45.498Z",
    "updatedAt": "2025-06-09T21:13:43.211Z",
    "__v": 0
  },
  {
    "_id": "68474cd4f2a20e1d1088bccb",
    "carTitle": "Mercedes CLA",
    "carDesc": "The CLA-class is a compact luxury 4-door coupe that offers modest amounts of luxury with features including a standard sunroof, a 10.3-inch infotainment screen, an attractively sculpted dashboard and door panels, and a dramatic coupe-like profile",
    "carPrice": 45500,
    "carImage": "uploads/cars/deb79d37-9339-4216-8f27-da22ad7145dc.jpg",
    "createdAt": "2025-06-09T21:06:28.833Z",
    "updatedAt": "2025-06-09T21:06:28.833Z",
    "__v": 0
  }
]
```

</details>

<details>
<summary><strong>2. POST /car/create - Yangi avtomobil qo'shish</strong></summary>

### Tavsif

Yangi avtomobil qo'shish.

### So'rov

- Metod: `POST`
- Headers: `Content-Type: application/json`
- Body (JSON):

```json
{
  "carTitle": "CAR1",
  "carDesc": "CAR DESC",
  "carPrice": 20,
  "carImage": "uploads/cars/5598e8c5-c707-4379-914a-c9df750859cc.jpg"
}
```

### Javob

```json
{
  "carTitle": "CAR1",
  "carDesc": "CAR DESC",
  "carPrice": 20,
  "carImage": "uploads/cars/5598e8c5-c707-4379-914a-c9df750859cc.jpg",
  "_id": "68524e3e7e650e22b7df1941",
  "createdAt": "2025-06-18T05:27:26.736Z",
  "updatedAt": "2025-06-18T05:27:26.736Z",
  "__v": 0
}
```

</details>

<details>
<summary><strong>3. POST /car/update - Mavjud avtomobil ma'lumotlarini yangilash</strong></summary>

### Tavsif

Mavjud avtomobil ma'lumotlarini yangilash.

### So'rov

- Metod: `POST`
- Headers: `Content-Type: application/json`
- Body (JSON):

```json
{
  "_id": "67550eedd7249972b3b65a93",
  "carTitle": "CAR1",
  "carDesc": "CAR DESC",
  "carPrice": 20,
  "carImage": "uploads/cars/5598e8c5-c707-4379-914a-c9df750859cc.jpg"
}
```

### Javob

```json
{
  "_id": "68524e3e7e650e22b7df1941",
  "carTitle": "CAR1",
  "carDesc": "CAR DESC",
  "carPrice": 20,
  "carImage": "uploads/cars/5598e8c5-c707-4379-914a-c9df750859cc.jpg",
  "createdAt": "2025-06-18T05:27:26.736Z",
  "updatedAt": "2025-06-18T05:28:20.996Z",
  "__v": 0
}
```

</details>

<details>
<summary><strong>4. POST /car/upload/image - Avtomobil rasmi yuklash</strong></summary>

### Tavsif

Avtomobil rasmi yuklash.

### So'rov

- Metod: `POST`
- Headers: `Content-Type: multipart/form-data`
- Form-data maydonlari:
  - `carImage`: rasm fayli (JPEG, PNG, WEBP)

### Javob

```json
{
  "fieldname": "carImage",
  "originalname": "c07deae8-bead-4f16-9415-4e25567d1f11.jpg",
  "encoding": "7bit",
  "mimetype": "image/jpeg",
  "destination": "./uploads/cars",
  "filename": "7e0ea2b0-df45-41ea-ae19-86e340e7de80.jpg",
  "path": "uploads/cars/7e0ea2b0-df45-41ea-ae19-86e340e7de80.jpg",
  "size": 1997135
}
```

</details>

<details>
<summary><strong>5. POST /car/delete/:id - Avtomobilni o'chirish</strong></summary>

### Tavsif

Berilgan ID ga ega avtomobilni o'chirish.

### So'rov

- Metod: `POST`
- URL parametri: `id` — o'chiriladigan avtomobil ID si

### Javob

```json
{
  "_id": "68524e3e7e650e22b7df1941",
  "carTitle": "CAR1",
  "carDesc": "CAR DESC",
  "carPrice": 20,
  "carImage": "uploads/cars/5598e8c5-c707-4379-914a-c9df750859cc.jpg",
  "createdAt": "2025-06-18T05:27:26.736Z",
  "updatedAt": "2025-06-18T05:28:20.996Z",
  "__v": 0
}
```

</details>

---

**End of documentation**
