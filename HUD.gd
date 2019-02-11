extends CanvasLayer

signal start_game
			

func menampilkan_pesan(text): #fungsi untuk menampilkan pesan
	$PesanLabel.text = text #Memasukan variabel text kedalam label pesan
	$PesanLabel.show() #Perintah menampilkan pesan
	$MessageTimer.start() #Perintah memulai waktu

func menampilkan_game_over():
	menampilkan_pesan("Game Over") #Merubah label pada tampilan pesan menjadi game over
	yield($MessageTimer, "timeout")
	$StartButton.show() #Menampilkan kembali start button
	$PesanLabel.text = "Hindari Ancaman!"
	$PesanLabel.show()

func update_score(score):
	$ScoreLabel.text = str(score)



func _on_StartButton_pressed():
	$StartButton.hide() #Menyembunyikan button
	$SoundButton.play()
	emit_signal("start_game")


func _on_MessageTimer_timeout():
	$PesanLabel.hide()


