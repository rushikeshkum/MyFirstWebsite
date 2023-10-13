class Employee{
			constructor(id,Name,Address,Email,Mobile,DOB,Gender,Hobby,Departments)
			{


			this.id=id;
			this.Name=Name;
			this.Address=Address;
			this.Email=Email;
			this.Mobile=Mobile;
			this.DOB=DOB;
			this.Gender=Gender;
			this.Hobby=Hobby;
			this.Departments=Departments;

			}
			
		}

		var Emplist=[];

		function Save()
		{
			var Id=document.getElementById('txtId');
			var errId=document.getElementById('err_Id');

			var Name=document.getElementById('txtName');
			var err_Name=document.getElementById('err_Name');
			
			var Address=document.getElementById('txtAddress');
			var err_Address=document.getElementById('err_Address');
			
			var Email=document.getElementById('txtEmail');
			var err_Email=document.getElementById('err_Email');
			
			var MobileNo=document.getElementById('txtMobileNo');
			var err_Mobile=document.getElementById('err_Mobile');
			
			var BirthDate=document.getElementById('txtBirthDate');
			var err_DOB=document.getElementById('err_DOB');
			
			var GenderMale=document.getElementById('rdoMale');
			var GenderFemale=document.getElementById('rdoFemale');
			var err_Gender=document.getElementById('err_Gender');


			var cricket=document.getElementById('chkCricket');
			var Reading=document.getElementById('chkReading');
			var chkSwiming=document.getElementById('chkSwiming');
			var err_Hobbie=document.getElementById('err_Hobies');

			var dep=document.getElementById('cmbDp');

		// Reset

			Id.style="";
			errId.innerHTML="";

			Name.style="";
			err_Name.innerHTML="";

			Address.style="";
			err_Address.innerHTML="";

			Email.style="";
			err_Email.innerHTML="";

			MobileNo.style="";
			err_Mobile.innerHTML="";

			BirthDate.style="";
			err_DOB.innerHTML="";

			err_Gender.innerHTML="";

			err_Hobbie.style=""
			err_Hobbie.innerHTML="";
			


		// vlidation
		if (Id.value.trim()=="") {
			Id.focus();
			Id.style="border:2px solid red;";
			errId.innerHTML="Id is Mandotry";
			return;

		}

		if (Name.value.trim()=="") {
			Name.focus();
			Name.style="border:2px solid red;";
			err_Name.innerHTML="Name is Mandotry";
			return;

		}

		if (Address.value.trim()=="") {
			Address.focus();
			Address.style="border:2px solid red;";
			err_Address.innerHTML="Address is Mandotry";
			return;

		}



		if (Email.value.trim()=="") {
			Email.focus();
			Email.style="border:2px solid red;";
			err_Name.innerHTML="Email is Mandotry";
			return;
		}


		var Emailregx =/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

		if (Emailregx.test(Email.value)==false) 
		{
			Name.focus();
			Name.style="border:2px solid red;";
			err_Email.innerHTML="Email is Wrong";
			return;

		}


		if (MobileNo.value.trim()=="") {
			MobileNo.focus();
			MobileNo.style="border:2px solid red;";
			err_Mobile.innerHTML="Mobile no is Mandotry";
			return;

		}

		var Mobilergx=/^\d{10}$/;

		if (Mobilergx.test(MobileNo.value)==false) 
		{
			MobileNo.focus();
			MobileNo.style="border:2px solid red;";
			err_Mobile.innerHTML="Mobile no is Wrong";
			return;

		}

		if (BirthDate.value.trim()=="") {
			BirthDate.focus();
			
			err_DOB.innerHTML="Birth Date is Mandotry";
			return;

		}

		

		if (rdoMale.checked== false && rdoFemale.checked==false) 
		{
			rdoMale.focus();
			err_Gender.innerHTML="Gender is Mandotry";
			return;
		}
		
		if (chkCricket.checked== false && chkReading.checked==false  && chkSwiming.checked==false) 
		{
			chkCricket.focus();
			err_Hobbie.style="border:2px solid red;"
			err_Hobbie.innerHTML="Hobbie are Requred";
			return;
		}

// Save arry
		var gen="Male";
		if (rdoFemale.checked) 
		{
			gen="Female";
		};

		
		var hbarry=[];

		if (chkCricket.checked) 
		{
			hbarry.push("cricket");
		};
		if (chkSwiming.checked) 
		{
			hbarry.push("Swiming");
		};
		if (chkReading.checked) 
		{
			hbarry.push("Reading");
		};

		var strhb= hbarry.join(",");

		// var Empobj=
		// {
		// 	"id":Id.value,
		// 	"Name":Name.value,
		// 	"Address":Address.value,
		// 	"Email":Email.value,
		// 	"Mobile":MobileNo.value,
		// 	"DOB":BirthDate.value,
		// 	"Gender":gen,
		// 	"Hobby":strhb,
		// 	"Departments":dep.options[dep.selectedIndex].text


		// };
		var Empobj= new Employee(Id.value,Name.value,Address.value,Email.value,MobileNo.value,BirthDate.value,gen,strhb,dep.options[dep.selectedIndex].text);





		var empPosition= GetEmployeePossitionByID(Id.value);

		if (GetEmployeePossitionByID(Id.value)!=-1) {

			Emplist.splice(empPosition,1);
			console.log("Old data deleted");

		};

		Emplist.push(Empobj);
		alert("Saved");
		document.getElementById('frmEmp').reset();
		LoadData();
		document.getElementById('txtId').disabled =false;

		}

		function GetEmployeePossitionByID(_id) 
		{
			for (var i =0; i <Emplist.length; i++) 
			{
				if (Emplist[i].id==_id)
			    {
			    	return i;

				}
				return-1;
			}
		}

		function DeleteEmp(index)
		{
			if (index>=0) 
			{
				if (confirm("Are you really want?"))
				 {
				 	Emplist.splice(index,1);
					alert("Deleted Successfully");
					LoadData();
				 }
			
			}

		}
		try {
  	function FindEmp(_id)
		{

			document.getElementById('frmEmp').reset();

			if (_id>0)
			 {

			Emplist
				 for (var i = 0; i <Emplist.length; i++) { 
				 		if (Emplist[i].id==_id) 
				 			{
				 			 document.getElementById('txtId').value=Emplist[i].id;
				 			  document.getElementById('txtName').value=Emplist[i].Name;
				 			   document.getElementById('txtAddress').value=Emplist[i].Address; 
				 			   document.getElementById('txtEmail').value=Emplist[i].Email;
				 			    document.getElementById('txtMobileNo').value=Emplist[i].Mobile;
				 			     document.getElementById('txtBirthDate').value=Emplist[i].DOB;
				 			     

				 			     if (Emplist[i].Gender=="Male") 
				 			     {
				 			     	document.getElementById('rdoMale').checked=true;
				 			     }else
				 			     {
				 			     	document.getElementById('rdoFemale').checked=true;

				 			     }

				 			     var str=Emplist[i].Hobby;
				 			     var arrhb=str.split(",");
				 			     for (var j = 0; j <arrhb.length;j++)
				 			      {
				 			      	if (arrhb[j]=="Cricket")
				 			      	 {
				 			      	 	document.getElementById('chkCricket').checked=true;
				 			      	 }
				 			      	 if (arrhb[j]=="Reading")
				 			      	 {
				 			      	 	document.getElementById('chkReading').checked=true;
				 			      	 }
				 			      	 if (arrhb[j]=="Swiming")
				 			      	 {
				 			      	 	document.getElementById('chkSwiming').checked=true;
				 			      	 }
				 			    		
				 			      }

				 			   var depr = document.getElementById('cmbDp');
				 			   depr.options[depr.selectedIndex].text=EmpList[i].Departments;
				 			     
				 			   document.getElementById('txtId').disabled =true;


				 		 	break; 
				 			}

					}
			}
		}
			}
		catch(err) 
			{
  					alert(err.message);
			}

		
	
		function LoadData()
		{
			var str="";

			for (var i = 0; i < Emplist.length; i++) 
			{ 
				str=str+ "<tr><td><button class='btn btn-info' onclick='FindEmp("+Emplist[i].id+")'>Edit</button><button class='btn btn-danger' onclick='DeleteEmp("+i+")'>Delete</button></td><td>"+Emplist[i].id+"</td><td>"+Emplist[i].Name+"</td><td>"+Emplist[i].Address+"</td><td>"+Emplist[i].Mobile+"</td><td>"+Emplist[i].Email+"</td><td>"+Emplist[i].DOB+" </td><td>"+Emplist[i].Gender+"</td><td>"+Emplist[i].Hobby+"</td><td>"+Emplist[i].Departments+"</td></tr>";
			
			};

			document.getElementById('tableBody').innerHTML =str;
		}




