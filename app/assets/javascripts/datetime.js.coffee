class DateTimeInput
  constructor: ->
    startDate = new Date()
    endDate = (new Date())
    endDate.setDate(startDate.getDate()+180)

    $('.date').datepicker(
      {
        startDate: startDate,
        endDate: endDate,
        language: 'es',
        format: 'dd/mm/yyyy',
        autoclose: true
      }
    )

    $('.time').inputmask('h:s t', {autoUnmask: true, placeholder: " "});

App.Utilities.DateTimeInput = DateTimeInput