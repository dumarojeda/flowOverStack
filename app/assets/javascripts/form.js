$( document ).ready(function() {
  bindEvents()

 });

function bindEvents(){
  $("#a-preview").off("click");
  $("#a-editor").off("click");
  $("#a-preview").on("click", previewEditor);
  $("#a-editor").on("click", showEditor);
  console.log("an bind events")
}

function showEditor(e){
  e.preventDefault()
  $(this).tab('show')
  console.log("en showEditor")
  bindEvents();
}

function previewEditor(e){
  e.preventDefault()
  $(this).tab('show')
  console.log("en previewEditor")
  var data = $("#en-form").val()
  var title = $("#question_name").val()
  // console.log
  var url = "/questions/preview"
  $.ajax({
    url: url,
    method: "GET",
    data: {
      name: title,
      description: data
    }
  }).done("HECHO").fail()
  bindEvents()
}
