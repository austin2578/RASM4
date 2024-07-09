.global String_toUpperCase
String_toUpperCase:

toUpperCase_loop:
    ldrb w3, [x0]  // Load a character from the string into w3
    cmp w3, #0     // Compare the character with null terminator
    b.eq end_toUpperCase // If it's the end of the string, exit the loop

    // Check if the character is a lowercase letter (ASCII range a-z)
    cmp w3, #'a'
    blt continue_toUpperCase
    cmp w3, #'z'
    bgt continue_toUpperCase

    // Convert to uppercase (subtract the ASCII difference)
    sub w3, w3, 'a' - 'A'
    strb w3, [x0]  // Store the uppercase character back in the string

continue_toUpperCase:
    add x0, x0, #1  // Increment the string pointer
    b toUpperCase_loop  // Repeat the loop

end_toUpperCase:
    ret
.end

//Austin Monroe and Jocelyne Gallardo