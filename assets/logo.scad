$fn = 80;

radius = 50;
text1 = " MODELLFLUGVEREIN ";
text2 = "  PETERSBERG e.V. ";

module revolve_text(radius, chars) {
    PI = 3.14159;
    circumference = 2 * PI * radius;
    chars_len = len(chars);
    font_size = circumference / chars_len / 2;
    step_angle = 180 / chars_len;
    for(i = [0 : chars_len - 1]) {
        rotate(-i * step_angle+85) 
            translate([0, radius + font_size / 2, 0]) 
                text(
                    chars[i], 
                    font = "Droid Sans; Style = Bold", 
                    size = font_size, 
                    valign = "center", halign = "center"
                );
    }
}

module revolve_text2(radius, chars) {
    PI = 3.14159;
    circumference = 2 * PI * radius;
    chars_len = len(chars);
    font_size = circumference / chars_len / 2;
    step_angle = 180 / chars_len;
    for(i = [0 : chars_len - 1]) {
        rotate(i * step_angle+95) 
            translate([0, radius + font_size / 2, 0]) 
				rotate(180)
                text(
                    chars[i], 
                    font = "Courier New; Style = Bold", 
                    size = font_size, 
                    valign = "center", halign = "center"
                );
    }
}

difference() {
	circle(d=125);
	circle(d=94);
	revolve_text(radius, text1);
	revolve_text2(radius, text2);
}

module kirche() {
	polygon([ [-10,0], [-10,10], [10,10], [10,0] ]); // schiff
	polygon([ [-10,11], [-10,18], [10,18], [10,11] ]); // dach
	polygon([ [-17,0], [-17,16], [-11,16], [-11,0] ]); // linker turm
	polygon([ [-18,17], [-14, 23], [-10,17] ]); // linkes dach
	difference() {
		polygon([ [11,0], [11,8], [16,14], [21,8], [21,0] ]); // rechtes haus
		polygon([ [15,5], [15,10], [17,10], [17,5] ]); // fenster
	}
	polygon([ [11,10], [11,16], [16,16] ]); // rechter turm
	polygon([ [10,17], [13,21], [13,23], [14,25], [15,23], [15,21], [18,17] ]); // rechtes dach
}

module airplane() {
	translate([0,-10])
		resize([15,20])
			circle(d=20);
	translate([-1,0])
		square([2,20]);
	translate([-20,20-2])
		square([40,2]);
		
	polygon([ [0,-5], [0,-12], [100,0], [100,2] ]);
	mirror([1,0])
		polygon([ [0,-5], [0,-12], [100,0], [100,2] ]);
}
translate([0,4])
	airplane();
	
translate([0,-47])
	kirche();
