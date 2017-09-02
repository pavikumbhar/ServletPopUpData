<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
 <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript">
  
  $(document).ready(function(){
	  
	  $("#createTableFromJson").click(function(){
		  
		  createTableFromJson(); 
	     
	  }); 
 });
  
/*   $(document).on('click','#clickMe',function(){
	    alert("button");
	});
   */
  
  
 $(document).ready(function(){
	
	  $("#clickMe").click(function(){
		  
		  $('#dialog').dialog('open');
	     
	  }); 
	  
	  $("#Dynamic").click(function(){
		  AtLeastOneFillDialog();
		 
	     
	  }); 
	  
	  
	  
	   $("#dynaDialog").click( function() {
		  
		   var dynaDialog = $("<div></div>");
	     $.ajax({
	         url: 'loadAjaxDataServlet',
	         success: function (html) {
	        	
	        	 dynaDialog.html(html).dialog({ 
	        		 							modal: true,
	        		 							autoOpen: false, 
	        		 							title: 'Dialog',
	        		 							width:  $(window).width() - 200,
	        		 							height: $(window).height() - 100,
	        		 						    draggable: false,
	        		 						    resizable: false,
	        		 						    //position: ['center', 'top'],
	        		 						   // show: 'blind',
	        		 						    hide: 'blind',
	        		 						 }).dialog('open');
	        }
	     });
	   });
	  
	  
	  
 });
 
   $(function () {
	  
      $("#dialog").dialog({
          modal: true,
          autoOpen: false,
          title: "jQuery Dialog",
          width: 500,
          height: 450
      });
      
  });
  

  
  
  function showUrlInDialog(url, options){
	    options = options || {};
	    var tag = $("<div></div>"); //This tag will the hold the dialog content.
	    $.ajax({
	      url: url,
	      type: (options.type || 'GET'),
	      beforeSend: options.beforeSend,
	      error: options.error,
	      complete: options.complete,
	    
	      success: function(data, textStatus, jqXHR) {
	        if(typeof data == "object" && data) { //response is assumed to be JSON
	        	alert("object"+JSON.stringify(obj))
	            //tag.html(data).dialog({modal: options.modal, title: data.title}).dialog('open');
	        	//tag.html(data).dialog({modal: options.modal, title: options.title,width: options.width,height: options.height}).dialog('open');
	        } else { //response is assumed to be HTML
	          tag.html(data).dialog({modal: options.modal, title: options.title,width: options.width,height: options.height}).dialog('open');
	        }
	        $.isFunction(options.success) && (options.success)(data, textStatus, jqXHR);
	      }
	    });
	  }
  </script>
  
  
       <script>
       function AtLeastOneFillDialog(){
            var dynamicAtLeastOneFillLegThree = $('<div id="conformBox">'+
        '<span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;">'+
        '</span>Please Fill at least one answers...   </div>');
       dynamicAtLeastOneFillLegThree.dialog({
                title : "Please Fill at least one answers... ",
                closeOnEscape: true,
                modal : true,
        
               buttons : 
                        [{
                                text : "Ok",
                                click : function() {
                                        $(this).dialog("close");
                                       
                                }
                        },{
                            text : "Cancel",
                            click : function() {
                                    $(this).dialog("close");
                                   
                            }
                    }]
        });
           
       }
      </script>
      
      
      <script type="text/javascript">
      function createTableFromJson() {
    	  var dynaDialog = $("<div></div>");
          
          $.post('loadAjaxDataServlet', function (data) {
        
        	  var trHTML = '<table  class="table table-striped table-bordered">';
        	  trHTML += '<thead><tr class="info"><th>#</th><th>Name</th><th>Email</th></tr></thead>'
              trHTML +='<tbody>' 
              $.each(data, function (i, item) {
            	   cssClass=(i % 2== 0) ? "success": "warning";
                  trHTML += '<tr class='+cssClass+'><td>' + i + '</td><td>' + item.name + '</td><td>' + item.email + '</td></tr>';
              });
              trHTML += '</tbody></table>'
              
              dynaDialog.html(trHTML).dialog({ 
    				modal: true,
    				autoOpen: false, 
    				title: 'Dialog',
    				width:  $(window).width() - 200,
    				height: $(window).height() - 100,
    			    draggable: false,
    			    resizable: false,
    			    //position: ['center', 'top'],
    			   // show: 'blind',
    			    //hide: 'blind',
    			 }).dialog('open');
              
          });
        
      }

      
      
      
      
      
      </script>
</head>
<body>
<div>
	<button id="clickMe" class="btn btn-primary">Simple Dialog</button>
	<button id="Dynamic" class="btn btn-warning ">Dynamic</button>
	<button id="dynaDialog" class="btn btn-danger">dynaDialog</button>
	<a href="#" onclick="showUrlInDialog('loadAjaxDataServlet', {title:'Pravin',modal: true, width: 500,height: 450,error: function() { alert('Could not load form')}}); return false;">Dynamic Generic</a>
</div>
<br>
<div>
<button id="createTableFromJson" class="btn btn-info">createTableFromJson</button>
</div>

 <div id="dialog" style="display: none" align = "center">
    This is a jQuery Dialog.
</div>
</body>
</html>