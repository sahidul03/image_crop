jQuery ->
  new CarrierWaveCropper()

class CarrierWaveCropper
  constructor: ->
    $('#user_photo_cropbox').Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 50, 50]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#user_photo_crop_x').val(coords.x)
    $('#user_photo_crop_y').val(coords.y)
    $('#user_photo_crop_w').val(coords.w)
    $('#user_photo_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#user_photo_previewbox').css
      width: Math.round(100/coords.w * $('#user_photo_cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#user_photo_cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'
