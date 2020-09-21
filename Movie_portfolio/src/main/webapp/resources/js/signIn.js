 function toggleForm(){
        var container = document.querySelector('.container');
        container.classList.toggle('active')
    }
 
//아이디 중복체크
	function defaultCheckIdValue(){
		checkId.value = 2
		duplicationIdMsg.innerHTML = ''
	}
	function chkId() {
		var cid = frm.cid.value
		console.log('cid : ' + cid)
		if(cid.length == 0) {
			alert('아이디를 입력해 주세요')
			return false
		}
		
		axios.get('/member/chkId', {
		    params: {
		      cid: cid
		    }
		  }).then(function (response) { 
			  
			checkId.value = response.data.result
			var msg =''
		    switch(response.data.result){
		    	case 1:
		    		msg = '이미 사용 중 입니다.'
		    		break;
		   		 case 0:
		    		msg ='아이디를 사용할 수 있습니다.'
		    		break;  
		    	}
			duplicationIdMsg.innerHTML=msg
			
		  }).catch(function (error) {
		    console.log(error);
		  })
		
		
		return false
	}
	
	function chk() {
		if(checkId.value == 2){
			alert('아이디 중복 확인을 해주세요')
			return false
		}else if(checkId.value == 1){
			alert('다른 아이디를 사용해 주세요')
			return false
		}else if(frm.cid.value.length == 0) {
			alert('아이디를 입력해 주세요.')
			frm.uid.focus()
			return false
		} else if(frm.cpw.value == '') {
			alert('비밀번호를 입력해 주세요.')
			frm.upw.focus()
			return false
		} else if(frm.cpw.value != frm.upwConfirm.value) {
			alert('비밀번호를 확인해 주세요.')
			frm.upw.focus()
			return false
		}else if(frm.nm.value.length == 0) {
			alert('이름을 입력해 주세요.')
			frm.nm.focus()
			return false
		} else if(frm.email.value.length == 0){
			alert('eamil을 입력해 주세요')
			frm.email.focus()
			return false
		}		
	}