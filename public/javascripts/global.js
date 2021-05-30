var userListData = [];

$(document).ready(function() {

  populateBuses();

});

function populateBuses() {
  var busesContent = '';

  $.getJSON( '/buses', function( data ) {

  	buses = data

    $.each(data, function(index){
      busesContent += '<div class="p-2"><a href="#" class="linkshowbus" rel="' + index + '">' + this.name + '</a></div>';
    });
    $('#buses').html(busesContent);
    $('#buses').on('click', 'div a.linkshowbus', showBusInfo);
  });
};

function showBusInfo(event) {
	event.preventDefault();
	var bus = buses[$(this).attr('rel')];
	var tableContent = '<table class="table"><tr><th>Station</th></tr>';
	$.each(bus.stops, function(index){
      tableContent += '<tr>';
      tableContent += '<td><strong>' + this.station + '</strong></td>';
      var onTime = (this.status == 'ON-TIME');
      tableContent += '<td style="color: ' + ((onTime) ? 'green' : 'red') + '">' + this.status + '</td>';
      tableContent += '<td>Arrives ';
      if (onTime || this.arrival == this.delayedArrival) {
        tableContent += this.arrival;
      } else {
        tableContent += '<span style="text-decoration: line-through">' + this.arrival + '</span> ' + this.delayedArrival;
      }
      tableContent += '</td>';
      tableContent += '<td>Departs ';
      if (onTime || this.departure == this.delayedDeparture) {
        tableContent += this.departure;
      } else {
        tableContent += '<span style="text-decoration: line-through">' + this.departure + '</span> ' + this.delayedDeparture;
      }
      tableContent += '</td>';
      tableContent += '</tr>';
    });
    tableContent += '</table>';
	$('#busName').text(bus.name);
	$('#busSchedule').html(tableContent);
}