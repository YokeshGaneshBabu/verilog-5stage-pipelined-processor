#! /usr/bin/wish

# Create the popup window
proc create_popup {} {
    # Create a new toplevel window
    toplevel .popup
    wm title .popup "Simulation Control"
    # Set the size of the window
    wm geometry .popup 400x300

    # Initialize the parent for button storage
    set buttons(parent) {}

    # Add buttons to the popup window
    include_buttons .popup
}

# This will add the buttons directly to the given parent (popup window)
proc include_buttons {parent} {
    add_frame $parent "Control"
    add_button $parent "Create Library"  {vlib work; vmap work work}
    add_button $parent "Compile"         {vlog D:/lol/MipsPipelineTestBench.v}
    add_button $parent "Load Simulation" {vsim -voptargs=+acc work.MipsPipelineTestBench}
    add_button $parent "Wave Window"     {add wave -r /*}
    add_button $parent "Quit"            {quit -force}

    add_frame $parent "Simulate"
    add_button $parent "Run 10"   {run 10}
    add_button $parent "Run 100"  {run 100}
    add_button $parent "Run 1000" {run}
    add_button $parent "Run all"  {run -all}
    add_button $parent "Restart"  {restart -f}
}

# This function adds a frame to the given parent
proc add_frame {parent title} {
    global buttons
    set buttons(frame) $parent.frame$buttons(widget_count)
    frame $buttons(frame) -border 2 -relief groove
    label $buttons(frame).label -text $title -font $buttons(font)
    pack  $buttons(frame)       -side top -padx 2 -pady 2 -anchor n -fill both -expand 1
    pack  $buttons(frame).label -side top  -padx 2 -pady 2
    incr buttons(widget_count)
}

# This function adds a button to the frame within the given parent window
proc add_button {parent title command} {
    global buttons
    button $parent.b$buttons(widget_count) -text $title -font $buttons(font) -command "puts \"$command\"; $command"
    pack   $parent.b$buttons(widget_count) -side top -pady 2 -padx 2 -fill x
    incr buttons(widget_count)
}

# Set default font for buttons
set buttons(font) [font create -family {Arial Helvetica "Courier New"} -size 12]
set buttons(widget_count) 1

# Create the popup window
create_popup
