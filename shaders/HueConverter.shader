//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_OldHue;
uniform float u_NewHue;
uniform float u_Tolerance;
void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_OldHue;
uniform float u_NewHue;
uniform float u_Tolerance;


vec3 rgb2hsl(vec3 in_color){
    int maxclr = 0;
    if(in_color.g > in_color.r){
        maxclr = 1;
        if(in_color.b>in_color.g){
            maxclr = 2;
        }
    }
    float cmax = max(max(in_color.r, in_color.g), in_color.b);
    float cmin = min(min(in_color.r, in_color.g), in_color.b);
    float delta = cmax-cmin;
    vec3 out_color = vec3(0.0, 0.0, 0.0);
    out_color.b = (cmin+cmax)/2.0;
    if(delta == 0.0){
        out_color.r = 0.0;
        out_color.g = 0.0;
    }else{
        out_color.g = delta/(1.0-abs(2.0*out_color.b-1.0));
        if(maxclr==0){
            out_color.r = 60.0*mod((in_color.g-in_color.b)/delta , 6.0);
        }
        else if(maxclr==1){
            out_color.r = 60.0*((in_color.b-in_color.r)/delta + 2.0);   
        }
        else{
            out_color.r = 60.0*((in_color.r-in_color.g)/delta + 4.0);   
        }
    }
    out_color.r = atan(sqrt(3.0)*(in_color.g-in_color.b), 2.0*in_color.r-in_color.g-in_color.b) *180.0/3.1416;

    if(out_color.r<0.0) out_color.r += 360.0;  
    //out_color.r = 180.0;  
    out_color.r = clamp(out_color.r,0.0,360.0);
    out_color.g = clamp(out_color.g,0.0,1.0);
    out_color.b = clamp(out_color.b,0.0,1.0);
    //out_color.r = in_color.b;
    //out_color.g = 0.0;
    //out_color.b = 0.0;
    return out_color;
}

vec3 hsl2rgb(vec3 in_color){
    vec3 out_color = vec3(0.0,0.0,0.0);
    float c = in_color.g*(1.0-abs(2.0*in_color.b-1.0));
    float X = c*(1.0-abs(mod(in_color.r/60.0,2.0)-1.0));
    float m = in_color.b-c/2.0;
    if(in_color.r < 60.0){
        out_color.r = c;
        out_color.g = X;
    }else if(in_color.r<120.0){
        out_color.r = X;
        out_color.g = c;
    }else if(in_color.r<180.0){
        out_color.b = X;
        out_color.g = c;
    }else if(in_color.r<240.0){
        out_color.g = X;
        out_color.b = c;
    }else if(in_color.r<300.0){
        out_color.r = X;
        out_color.b = c;
    }else{
        out_color.r = c;
        out_color.b = X;
    }
    
    return clamp(out_color+m,0.0,1.0);
}

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    vec3 hsl = rgb2hsl(gl_FragColor.rgb);
    //vec4 out_color = vec4(v_vColour);
    float hue = hsl.r;
    /*
    if( abs(hue-u_OldHue) < u_Tolerance){
        gl_FragColor.rgb = vec3(1.0,0.0,0.0);
    }
    else
        gl_FragColor.rgb = vec3(0.0,0.0,0.0);
    */
    //gl_FragColor.rgb = vec3(hue/360.0,hue/360.0,hue/360.0);
    
    if(hue<0.0) hue+=360.0;
    if( abs(hue-u_OldHue) < u_Tolerance){
        hsl.r = u_NewHue;
        gl_FragColor.rgb = hsl2rgb(hsl);
    }
    
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
}

