var marker;
var map;
var geocoder = new google.maps.Geocoder();

function initialize_map(latitude_ini, longitude_ini) {
	if(latitude_ini != undefined && latitude_ini != ""){
		map_create(latitude_ini, longitude_ini, 10);
		school_address= new google.maps.LatLng(latitude_ini, longitude_ini);
		add_marker(school_address);
	}else{
		jQuery.ajax({
	    	url: "http://freegeoip.net/json/",
			type: "get"
	  	}).done(function(result){
	  		var latitude= result.latitude;
	  		var longitude= result.longitude;
	  		if(latitude != undefined && latitude != "" && longitude != undefined && longitude != "" ){
	  			map_create(latitude, longitude, 10);
	  		} else {
	  			map_create("40.4167754", "-3.703790", 5);
	  		}
	  	});
  	}
}

function map_create(lat, lng, zoom){
	var mapOptions = {
		zoom: zoom,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		center: new google.maps.LatLng(lat,lng),
		disableDoubleClickZoom: true
	};

  	map = new google.maps.Map(document.getElementById('map-canvas'),mapOptions);
  		
	google.maps.event.addListener(map, 'click', function(event) {
		if ($("[id$='_address']").closest(".field.editable").hasClass("active")){
			add_marker(event.latLng);
		}
	});
}

function add_marker(latLng){
	if(marker != undefined){
		marker.setMap(null);
	}
	marker = new google.maps.Marker({
		map:map,
		draggable:true,
		animation: google.maps.Animation.DROP,
		position: latLng
	});
	marker.setAnimation(google.maps.Animation.DROP);
	map.setCenter(marker.position);
	google.maps.event.addListener(marker, 'dblclick', function(){
		marker.setMap(null);
		$("[id$='_address']").val("");
		$("[id$='_latitude']").val("");
		$("[id$='_longitude']").val("");
	});
	google.maps.event.addListener(marker, 'dragend', function() {
		marker_geocoder(marker.getPosition());
		map.setCenter(marker.position);
	});
	marker_geocoder(latLng);
}


function popup_map_create(lat, lng, zoom){
	var mapOptions = {
		zoom: zoom,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		center: new google.maps.LatLng(lat,lng),
		disableDoubleClickZoom: true
	};

  	popup_map = new google.maps.Map(document.getElementById('popup_map-canvas'),mapOptions);
}

function popup_add_marker(latLng){
	
	popup_marker = new google.maps.Marker({
		map:popup_map,
		position: latLng
	});
	popup_map.setCenter(popup_marker.position);
}


function marker_geocoder(latlng){
	geocoder.geocode({'latLng': latlng}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
			if (results[0]) {
				$("[id$='_address']").val(results[0].formatted_address);
				$("[id$='_latitude']").val(results[0].geometry.location.lat());
				$("[id$='_longitude']").val(results[0].geometry.location.lng());
				
				/*var street= "";
				var locality= "";
				var country= "";
				var postalcode= "";
				console.log(results[0].formatted_address);
				$(results[0].address_components).each(function(index, component){
					console.log(component.long_name + "---" + component.types);
				});*/
			} else {
				alert('Address no valid');
				$("[id$='_address']").val("");
				$("[id$='_latitude']").val("");
				$("[id$='_longitude']").val("");				
			}
		} else {
			alert('Geocoder failed due to: ' + status);
		}
	});
}

function geolocalice_address(address){
	geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
      	add_marker(results[0].geometry.location);
       } else {
       	alert('Address no valid');
		$("[id$='_latitude']").val("");
		$("[id$='_longitude']").val("");
      }
    });
}

function press_key(e){
  key = (document.all) ? e.keyCode :e.which;
  if (key == 13){
  	geolocalice_address($("[id$='_address']").val());
  }
  return (key!=13);
}

function change_location_written(){
	geolocalice_address($("[id$='_address']").val());
}
