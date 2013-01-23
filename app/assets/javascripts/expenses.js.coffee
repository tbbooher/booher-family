$("#expense_category").change ->
  if this.value == String(2)
    $("#mileage_calculation").show()
    $("#expense_payer").val(2)
    console.log "showing"
  else
    $("#expense_payer").val(1)
    $("#mileage_calculation").hide()

$("#mileage_mileage").change ->
  miles = parseFloat(this.value)
  $("#expense_amount").val(Math.round(miles*0.55*100)/100)