extends TextureRect

#Function to display elements of the array

var is_selected = false

func _ready():
	set_process_input(true) # Enable input processing
#this is to fire an event when icon is left clicked
func _gui_input(event):
	if event.is_pressed() and event.button_index == BUTTON_LEFT:
		toggle_selected()
#When taonga is selected, give a visual confirmation and add to taonga array
func toggle_selected():
	is_selected = not is_selected
	if is_selected:
		self.rect_scale = Vector2(1.05, 1.05) # Increase size when selected 
		SocialMediaVars.social_array.append(self)
		print("Logo added")
		#continue button is enabled only when a social media is selected
		$"../Continue3".disabled = false
	else:
		SocialMediaVars.social_array.erase(self)
		print("Logo removed")
		self.rect_scale = Vector2(1, 1) # Reset to normal size when unselected
