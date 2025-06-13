document.addEventListener("DOMContentLoaded", async () => {
  const productList = document.getElementById("product-list");

  try {
    const res = await fetch("/api/products");
    if (!res.ok) throw new Error("โหลดสินค้าไม่สำเร็จ");

    const products = await res.json();
    productList.innerHTML = "";

    for (const product of products) {
      //  ดึงรีวิว
      let reviewsHtml = "<p class='no-reviews'>ยังไม่มีรีวิว</p>";
      try {
        const reviewRes = await fetch(`/api/products/${product.id}/reviews`);
        if (reviewRes.ok) {
          const reviews = await reviewRes.json();
          if (reviews.length > 0) {
            reviewsHtml = reviews.map(review => `
              <div class="review-item">
                <div class="review-header-info">
                  <span class="reviewer-name">${review.user?.name || "ไม่ระบุชื่อ"}</span>
                  <span class="review-date">${new Date(review.created_at).toLocaleDateString()}</span>
                </div>
                <div class="review-rating">⭐️ ${review.rating}</div>
                <div class="review-text">${review.content}</div>
              </div>
            `).join("");
          }
        }
      } catch (err) {
        console.error("ไม่สามารถโหลดรีวิว:", err);
      }

      //  แสดงสินค้า + รีวิว
      productList.innerHTML += `
        <div class="product-card">
          <img src="${product.url_img}" alt="${product.name}" class="product-image">
          <h3>${product.name}</h3>
          <p>${product.description}</p>
          <p> ราคา: ${product.price} บาท</p>
          <button class="btnReview" onclick="openReviewForm(${product.id}, '${product.name}')"> เขียนรีวิว</button>
          <div id="review-form-${product.id}" style="display:none;"></div>

          <div class="review-section">
            <h4> รีวิวสินค้า</h4>
            <div class="reviews-list">${reviewsHtml}</div>
          </div>
        </div>
      `;
    }
  } catch (err) {
    console.error(err);
    productList.innerHTML = "<p>เกิดข้อผิดพลาดในการโหลดสินค้า</p>";
  }
});

// เปิดฟอร์มเขียนรีวิว
function openReviewForm(productId, productName) {
  const container = document.getElementById(`review-form-${productId}`);
  container.innerHTML = `
    <div class="review-box">
      <h4>📝 เขียนรีวิวสำหรับ: <strong>${productName}</strong></h4>
      <label for="review-comment-${productId}">ความคิดเห็น:</label><br>
      <textarea id="review-comment-${productId}" rows="3" placeholder="พิมพ์ความเห็น..." style="width: 100%; margin-bottom: 10px;"></textarea>

      <label for="review-rating-${productId}">ให้คะแนน:</label><br>
      <select id="review-rating-${productId}" style="width: 100px; margin-bottom: 10px;">
        <option value="">เลือก</option>
        <option value="1">⭐️</option>
        <option value="2">⭐️⭐️</option>
        <option value="3">⭐️⭐️⭐️</option>
        <option value="4">⭐️⭐️⭐️⭐️</option>
        <option value="5">⭐️⭐️⭐️⭐️⭐️</option>
      </select>

      <div style="margin-top:10px;">
        <button class="btn" onclick="submitReview(${productId})"> ส่งรีวิว</button>
        <button class="btn1" onclick="cancelReviewForm(${productId})"> ยกเลิก</button>
      </div>
    </div>
  `;
  container.style.display = "block";
}

function cancelReviewForm(productId) {
  const container = document.getElementById(`review-form-${productId}`);
  container.innerHTML = "";
  container.style.display = "none";
}

//  ส่งรีวิว
async function submitReview(productId) {
  const comment = document.getElementById(`review-comment-${productId}`).value.trim();
  const rating = parseInt(document.getElementById(`review-rating-${productId}`).value);
  const token = localStorage.getItem("auth_token");

  if (!token) {
    alert("⚠ กรุณาเข้าสู่ระบบก่อนรีวิว");
    return;
  }

  if (!comment || isNaN(rating) || rating < 1 || rating > 5) {
    alert("กรุณาใส่ข้อความรีวิว และคะแนนระหว่าง 1 ถึง 5");
    return;
  }

  try {
    const res = await fetch(`/api/products/${productId}/reviews`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Bearer " + token,
        Accept: "application/json"
      },
      body: JSON.stringify({
        product_id: productId,
        content: comment,
        rating: rating
      }),
    });

    const data = await res.json();
    if (!res.ok) {
      alert(` ส่งรีวิวไม่สำเร็จ: ${data.message || 'ไม่ทราบสาเหตุ'}`);
      return;
    }

    alert(" ส่งรีวิวสำเร็จแล้ว!");
    cancelReviewForm(productId);

    
    location.reload();
  } catch (err) {
    console.error(err);
    alert("❌ เกิดข้อผิดพลาดในการส่งรีวิว");
  }
}
