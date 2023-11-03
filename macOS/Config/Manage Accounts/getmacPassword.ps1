param(
    [string]$inputString
)

function Rot13([string]$input) {
    $rot13 = ''
    foreach ($char in $input.ToCharArray()) {
        if ($char -ge 'A' -and $char -le 'Z') {
            $rot13 += [char]((([int]$char - 65 + 13) % 26) + 65)
        } elseif ($char -ge 'a' -and $char -le 'z') {
            $rot13 += [char]((([int]$char - 97 + 13) % 26) + 97)
        } else {
            $rot13 += $char
        }
    }
    return $rot13
}

function Rot5([string]$input) {
    $rot5 = ''
    foreach ($char in $input.ToCharArray()) {
        if ($char -ge '0' -and $char -le '9') {
            $rot5 += [char]((([int]$char - 48 + 5) % 10) + 48)
        } else {
            $rot5 += $char
        }
    }
    return $rot5
}

$rot13 = Rot13 $inputString
$rot5 = Rot5 $rot13

[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($rot5))
