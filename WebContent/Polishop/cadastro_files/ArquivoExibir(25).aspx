// POLISHOP JavaScript
// TV : v1.0

$(document).ready(function()
{
	if ($("body").attr("class") == "PolishopTV")
	{
		$("span.PlayPause a").click( function ()
		{
			if ( $(this).hasClass("pause") )
			{
				$(this).removeClass();
				$(this).addClass("play");
				videoPlay();
			}
				else
			{
				$(this).removeClass();
				$(this).addClass("pause");
				videoPause();
			};
		});
			
		$("span.FullScreen a").click( function ()
		{
			videoFullScreen();
		});
	};
});

function setURL () { vdo.URL='dddddd'; };
		
function videoPlay () { document.POLISHOPTVEMBED.Play(); };

function videoPause () { document.POLISHOPTVEMBED.Pause(); };

function videoStop () { document.POLISHOPTVEMBED.stop(); };

function videoFullScreen ()
{
   var player = document.getElementById( "POLISHOPTVEMBED" );
   player.DisplaySize = 3;
};