/*=============== SHOW HIDDEN - PASSWORD ===============*/
const showHiddenPass = (loginPass, loginEye) =>{
   const input = document.getElementById(loginPass),
         iconEye = document.getElementById(loginEye)

   iconEye.addEventListener('click', () =>{
      // สลับ type ของ input
      if(input.type === 'password'){
         // สลับ text
         input.type = 'text'

         // ใช้สำหรับ toggle password
         iconEye.classList.add('ri-eye-line')
         iconEye.classList.remove('ri-eye-off-line')
      } else{
         // สลับ type ของ input
         input.type = 'password'

         // ใช้สำหรับ toggle password
         iconEye.classList.remove('ri-eye-line')
         iconEye.classList.add('ri-eye-off-line')
      }
   })
}


showHiddenPass('login-pass','login-eye')
showHiddenPass('login-pass2','login-eye2')
showHiddenPass('login-pass1','login-eye1')
