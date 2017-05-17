$( document ).ready(function() {
  bindEvents()

 });

$(document).on('turbolinks:load', function() {
  bindEvents()
})
function bindEvents(){
  // Eventos para escribir/editar una pregunta o respuesta o comentario en el editor o para previsualizarlo:
  // qs = tipo escribir question
  // an = tipo escribir answer
  // ca = tipo escribir comentario a un answer
  // cq = tipo escribir comentario a una question
  $(".qs-preview").off("click");
  $(".qs-editor").off("click");
  $(".qs-preview").on("click", previewEditor);
  $(".qs-editor").on("click", showEditor);

  $(".an-preview").off("click");
  $(".an-editor").off("click");
  $(".an-preview").on("click", previewEditor);
  $(".an-editor").on("click", showEditor);

  $(".ca-preview").off("click");
  $(".ca-editor").off("click");
  $(".ca-preview").on("click", previewEditor);
  $(".ca-editor").on("click", showEditor);

  $(".cq-preview").off("click");
  $(".cq-editor").off("click");
  $(".cq-preview").on("click", previewEditor);
  $(".cq-editor").on("click", showEditor);

  // Eventos para crear un nuevo comentario, pregunta o respuesta
  $("#an-create").off("click");
  $("#an-create").on("click", createText);

  $("#ca-create").off("click");
  $("#ca-create").on("click", createText);

  $('#cq-create').off("click");
  $('#cq-create').on("click", createText);

  console.log("an bind events")
}



function showEditor(e){
  e.preventDefault()
  $(this).tab('show')
  console.log("en showEditor")
  console.log(this)
  $(this).parent().addClass("active")
  $(this).next().removeClass("active")
  bindEvents();
}

function previewEditor(typeEntry){
  event.preventDefault()
  $(this).tab('show')
  $(this).parent().addClass("active")
  $(this).next().removeClass("active")

  console.log(typeEntry)
  var typeEntry = this.className.split("-")[0]
  console.log("en previewEditor data:")
  var data = $("."+typeEntry+"-form").val()
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

function createText(){
  event.preventDefault()
  console.log(this)
  var typeEntry = this.id.split("-")[0]
  console.log(typeEntry)
  var url = "/answers/typeEntry"
  $.ajax({
    url: url,
    method: "GET",
    data: {
      typeEntry: typeEntry,
    }
  }).done("HECHO").fail()
  bindEvents() 
}