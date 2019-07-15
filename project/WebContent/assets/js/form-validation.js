// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
  'use strict'

  window.addEventListener('load', function () {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation')

    // Loop over them and prevent submission
    Array.prototype.filter.call(forms, function (form) {
      form.addEventListener('submit', function (event) {
        if (form.checkValidity() === false) {
          event.preventDefault()
          event.stopPropagation()
        }
        form.classList.add('was-validated')
      }, false)
    })
  }, false)
}())


function post(){
    new daum.Postcode({
        oncomplete: function(data) {
   
            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기한다.
            
            var fullAddr = data.address; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수
            
            // 기본 주소가 도로명 타입일 때 
            if(data.addressType === 'R'){
                // 법정동명이 있을 경우 추가
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !=='' ? ', ' + data.buildingName : data.buildingName);
                    // extraAddr 데이터 값이 있으면 " , 빌딩네임" 추가 없으면 바로 "빌딩네임" 추가
                }
                
                // 조합형주소의 우뮤에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다 (없으면 널스트링)
                fullAddr += (extraAddr !=='' ? '(' + extraAddr + ')' : '');
                
                // 우편번호 주소 정보를 해당 필드에 넣는다
                
            }               
            else if (data.addressType === 'J'){
                // 건물명이 있을 경우 추가
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !=='' ? ', ' + data.buildingName : data.buildingName);
                    // extraAddr 데이터 값이 있으면 " , 빌딩네임" 추가 없으면 바로 "빌딩네임" 추가
                }
                // 조합형주소의 우뮤에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다 (없으면 널스트링)
                fullAddr += (extraAddr !=='' ? '(' + extraAddr + ')' : '');
            }
                document.getElementById('postCode').value = data.zonecode; // 5자리 새 우편번호 사용
                document.getElementById('roadAddress').value = fullAddr;
                document.getElementById('detailAddress').focus();
        }
    }).open();
}






