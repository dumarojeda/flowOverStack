$( document ).ready(function() {
  bindEvents()

 });

$(document).on('turbolinks:load', function() {
  bindEvents()
})
function bindEvents(){
  $("#qs-preview").off("click");
  $("#qs-editor").off("click");
  $("#qs-preview").on("click", previewEditor);
  $("#qs-editor").on("click", showEditor);

  $("#an-preview").off("click");
  $("#an-editor").off("click");
  $("#an-preview").on("click", previewEditor);
  $("#an-editor").on("click", showEditor);

  $("#ca-preview").off("click");
  $("#ca-editor").off("click");
  $("#ca-preview").on("click", previewEditor);
  $("#ca-editor").on("click", showEditor);

  $("#cq-preview").off("click");
  $("#cq-editor").off("click");
  $("#cq-preview").on("click", previewEditor);
  $("#cq-editor").on("click", showEditor);


  console.log("an bind events")
}



function showEditor(e){
  e.preventDefault()
  $(this).tab('show')
  console.log("en showEditor")
  bindEvents();
  console.log(this)
  $(this).parent().addClass("active")
  $(this).next().removeClass("active")
}

function previewEditor(typeEntry){
  event.preventDefault()
  console.log(this)
  $(this).tab('show')
  $(this).parent().addClass("active")
  $(this).next().removeClass("active")

  console.log(typeEntry)
  var typeEntry = this.id.split("-")[0]
  console.log("en previewEditor")
  var data = $("#"+typeEntry+"-form").val()
  console.log(data)
  var title = $("#question_name").val()
  // console.log
  var url = "/questions/preview"
  $.ajax({
    url: url,
    method: "GET",
    data: {
      typeEntry: typeEntry,
      name: title,
      description: data
    }
  }).done("HECHO").fail()
  bindEvents()
}
