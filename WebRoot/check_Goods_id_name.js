	function check(obj){
				
				var GoodsIDChecked = true;
				var goodsNameChecked = true;
				
				GoodsIDChecked = checkGoodsID(obj);
				goodsNameChecked = checkgoodsName(obj);
				
				
				var flag = GoodsIDChecked  && goodsNameChecked;
				
				return flag;
			}
			
			function checkGoodsID(obj){
				var ID = obj.deleteGoodsID.value;
				
				var flag = true;
				
				if(ID == ""){
					flag = false;
					D1.innerHTML="<font color='red' size='2'>&times;��Ʒ��Ų���Ϊ�գ�";
					return flag;
				}

				
				return flag;
			}
			
			function checkgoodsName(obj){
				var name = obj.deleteGoodsName.value;
				
				var flag = true;
				
				if(name == ""){
					flag = false;
					D2.innerHTML="<font color='red' size='2'>&times;��Ʒ���Ʋ���Ϊ�գ�";
					return flag;
				}
				
				return flag;
			}
			
			