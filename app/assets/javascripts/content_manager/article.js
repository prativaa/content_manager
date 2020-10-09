// var return_text;
// var selectedConversionIds = [];
// return_text = function(clicked_id) {
//   var id = clicked_id.split('_')[1];
//   $.ajax({
//     url: '/admin/conversions/' + id + '.json',
//     type: 'GET'
//   })
//     .done(function(data){
//       var oEditor = CKEDITOR.instances.article_body;
//       var oEditorTarget = oEditor.document.getById("conversion_" + id);
//       var html="<div class='conversion conversion-container' id=conversion_"+data['id'] +" data-conversion-id="+data['id'] +">"+
//         "<div class='conversion__body'>"+
//         data['body']+
//         "</div>"+
//         "</div><br>";
//       var newElement = CKEDITOR.dom.element.createFromHtml( html, oEditor.document );
//       if ( oEditorTarget === null ) {
//         oEditor.insertElement( newElement );
//       } else {
//         oEditorTarget.remove();
//       }
//     });
// };

var articleId = $('form').attr('id');
$("#new_article, [id^=edit_article]").submit(function(event){
  CKEDITOR.instances.article_body.document.find("div.conversion-container").$.forEach(function(elem){
    var elemId = parseInt(elem.id.split("_")[1]);
    selectedConversionIds.push(elemId);
    CKEDITOR.instances.article_body.document.getById("conversion_" + elemId).$.innerHTML="";
  });
  debugger;
  $('#conversion_field_id').val(selectedConversionIds);
});

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $('#ogp-preview').attr('src', e.target.result);
    }
    reader.readAsDataURL(input.files[0]);
  }
}

$("#article_ogp").change(function(){
  readURL(this);
});

$("#fileinput-remove").click(function(){
  $("#article_ogp").val("");
  $("#article_ogp_cache").val("");
  $("#ogp-preview").attr('src', '');
});
