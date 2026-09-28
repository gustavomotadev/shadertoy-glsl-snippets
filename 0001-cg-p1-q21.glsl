
float distEuclid(vec2 a, vec2 b) {
    return sqrt((a.x - b.x)*(a.x - b.x) + (a.y - b.y)*(a.y - b.y));
}

float distManhattan(vec2 a, vec2 b) {
    return abs(a.x - b.x) + abs(a.y - b.y);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {

    vec2 uv = fragCoord / iResolution.xy;
    uv = (uv * 20.0) - 10.0;
    
    bool is_circle = true;
    float color = 1.0;

    if ((uv.x > 0.0 && uv.y > 0.0) || (uv.x < 0.0 && uv.y < 0.0)) {

        color = 0.0;
    }

    vec2 uv2 = vec2(abs(uv.x) - 5.0, abs(uv.y) - 5.0);

    if(distEuclid(uv2, vec2(0.0, 0.0)) < 4.0 && is_circle) {
        color = 1.0 - color;
    }

    if(distManhattan(uv2, vec2(0.0, 0.0)) < 4.0 && !is_circle) {
        color = 1.0 - color;
    }

    fragColor = vec4(color, color, color, 1.0);
}