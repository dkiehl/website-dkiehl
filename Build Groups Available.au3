#include <Array.au3>
#include <DAK.au3>
#include <File.au3>

$xx = ''
$xx = ClipGet()
if StringRight($xx,4) <> '.m3u' then
	$xx = ''
EndIf

$file = InputBox('Select File','Enter full path of M3U file',$xx)
if @error <> 0 then Exit

$outfile = 'E:\WebServers\Kiehl.net\tv\Groups - ALL.txt'
Global $grp[1]
Global $ar[1]
Global $ar2[1]
$last = ''

_FileReadToArray($file,$ar,0)
$out = FileOpen($outfile,2)

ProgressOn('Building Groups - All','Processing...','',Default,Default,16)
$max = ubound($ar) - 1
for $i = 1 to $max
	ProgressSet($i / $max * 100)
	$x = $ar[$i]
	$j = StringInStr($x,'group-title=')
	if $j > 0 Then
		$x = StringMid($x,$j+13)
		$j = StringInStr($x,'"')
		$x = StringMid($x,1,$j-1)
		if $x <> $last then
			filewriteline($out,$x)
			$last = $x
		EndIf
	EndIf
Next
fileclose($out)

_FileReadToArray($outfile,$ar,0)
_ArraySort($ar)

$last = ''
$out = FileOpen($outfile,2)
$max = ubound($ar) - 1
for $i = 1 to $max
	ProgressSet($i / $max * 100)
	$x = StringStripWS($ar[$i],3)
	if $x <> $last then
		filewriteline($out,$x)
		$last = $x
	EndIf
Next
fileclose($out)
ProgressOff()
