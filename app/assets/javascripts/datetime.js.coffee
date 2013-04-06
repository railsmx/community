class DateTimeInput
  constructor: ->
    startDate = new Date()
    endDate = (new Date())
    endDate.setDate(startDate.getDate()+180)
 
    $('.datepicker').datepicker(
      { 
        startDate: startDate,
        endDate: endDate,
        language: 'es',
        format: 'dd/mm/yyyy',
        autoclose: false
      }
    )

App.Utilities.DateTimeInput = DateTimeInput