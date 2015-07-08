Geocoder.configure(

  :timeout => 3,
  :always_raise => [SocketError, TimeoutError,Geocoder::OverQueryLimitError,Geocoder::RequestDenied,Geocoder::InvalidRequest,Geocoder::InvalidApiKey],
  :google => {    
    :timeout => 5
  },
  :cloudmade => {
    :api_key =>"8a9a49dea2444f9d946a8ab47702ad85",
    :timeout => 7
  },
  :esri => {
    :timeout => 7
  },
  :bing => {
    :api_key => "Am_WXm_PQymco39xQgUGuRTmnqZzDAwQyPOB1VS8oy9fl_nXeYu0MqexG45msPgO",
    :timeout => 5
  },
  :mapquest => {
    :api_key => "Fmjtd%7Cluur2168nu%2C8a%3Do5-90zwgz",
    :timeout => 5
  },
  :yandex => {
    :timeout => 5
  },
  :nominatim => {
    :timeout => 5
  }

 

)