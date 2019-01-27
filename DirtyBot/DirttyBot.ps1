function DirttyBot
{

function ClearAndClose
{
$Timer.Stop(); 
$Form.Close(); 
$Form.Dispose();
$Timer.Dispose();
$Label.Dispose();
$Labe2.Dispose();
$Script:CountDown=5
}

function Timer_Tick
{

$Labe2.Text = "Your system will reboot in $Script:CountDown seconds"
        --$Script:CountDown
        if ($Script:CountDown -lt 0)
        {
        ClearAndClose
        }
}

#Start-Sleep -s 240
Add-Type -AssemblyName System.Windows.Forms
$Form = New-Object system.Windows.Forms.Form
$Form.Width = 500
$Form.Height = 450
$Form.BackColor = "Red"
$Font = New-Object System.Drawing.Font("Times New Roman",8,[System.Drawing.FontStyle]::Bold)
$Form.Font = $Font
$Label = New-Object System.Windows.Forms.Label
$Labe2 = New-Object System.Windows.Forms.Label
$Shadow = "`n____________________########__________________#"
$Shadow +="`n________________#################____________#"
$Shadow +="`n_____________######################_________#"
$Shadow +="`n____________#########################______#"
$Shadow +="`n__________############################"
$Shadow +="`n_________##############################"
$Shadow +="`n________###############################"
$Shadow +="`n________###############################"
$Shadow +="`n________#############################"
$Shadow +="`n_______________________#____########___#"
$Shadow +="`n__________##________###________####___##"
$Shadow +="`n_______________________________###___###"
$Shadow +="`n_____________________________####___###"
$Shadow +="`n________####__________##########___####"
$Shadow +="`n________#######################___####"
$Shadow +="`n__________####################___####"
$Shadow +="`n___________##################__####"
$Shadow +="`n_____________############______##"
$Shadow +="`n________________########________###"
$Shadow +="`n_______________#########________#####"
$Shadow +="`n______________############_____######"
$Shadow +="`n_____________########______#########"
$Shadow +="`n_______________#####_______########"
$Shadow +="`n_________________###_______#########"
$Shadow +="`n________________######____############"
$Shadow +="`n_______________#######################"
$Shadow +="`n_______________#___#___###__#___#___##"
$Shadow +="`n_______________########################"
$Shadow +="`n________________##_____##___##_____##"
$Shadow +="`n_____________________________________________________  VIRUS INFECTION _______"
$Label.Text = $Shadow
$Label.AutoSize = $True
$Labe2.AutoSize = $True
$Form.Controls.Add($Label)
$Form.Controls.Add($Labe2)

$Timer = New-Object System.Windows.Forms.Timer
$Timer.Interval = 800
$Script:CountDown = 6
$Timer.Add_Tick({ Timer_Tick})

$Timer.Start()
$Form.ShowDialog()

#Restart-Computer
}
