#ifndef PROTO_NB_POLYHEDRON
#define PROTO_NB_POLYHEDRON

float thorns(
    float2 pxy,
    float radius,
    int sides,
    float h
) {
    // check if the point is inside the thorn
    float plen = length(pxy);
    float pang = fmod(atan2(pxy.y, pxy.x) + 2*PI, 2*PI);
    float k = floor(sides * pang / (2*PI));
    float proj = plen * cos((2 * k + 1) * PI / sides - pang);
    float innerRadius = radius * cos(PI / sides);

    if(proj < innerRadius) {
        // it's inside the thorn: compute height
        float betak0 = 2 * PI * k / sides;
        float betak1 = 2 * PI * (k + 1) / sides;
        float xlk0 = radius * cos(betak0);
        float xlk1 = radius * cos(betak1);
        float ylk0 = radius * sin(betak0);
        float ylk1 = radius * sin(betak1);
        float delta = xlk0 * ylk1 - xlk1 * ylk0;
        float deltam = -h * (ylk1 - ylk0);
        float deltan = -h * (xlk0 - xlk1);
        float z = (deltam * pxy.x + deltan * pxy.y) / delta + h;
        // return z;
        return z;
        //return (innerRadius - proj) / innerRadius;
    } else {
        // it's not inside the thorn
        return 0;
    }
}

void torque(
    float3 vertexPositionOS,
    float3 normalOS,
    float theta,
    float maxH,
    out float3 rotatedVertexPositionOS,
    out float3 rotatedNormalOS
) {
    float h = vertexPositionOS.y;
    float t = h > 0 ? lerp(0, 1, h / maxH) : lerp(0, -1, -h / maxH);
    float c = cos(t * theta);
    float s = sin(t * theta);
    float3x3 rotationMatrix = float3x3(c, 0, s, 0, 1, 0, -s, 0, c);
    rotatedVertexPositionOS = mul(rotationMatrix, vertexPositionOS);
    rotatedNormalOS = mul(rotationMatrix, normalOS);
}

float3 rotate(float2 r, float3 vec) {
    float cosrx = cos(r.x);
    float sinrx = sin(r.x);
    float cosry = cos(r.y);
    float sinry = sin(r.y);
    float3x3 rotx = float3x3(1, 0, 0, 0, cosrx, -sinrx, 0, sinrx, cosrx);
    float3x3 roty = float3x3(cosry, 0, sinry, 0, 1, 0, -sinry, 0, cosry);
    return mul(rotx, mul(roty, vec));
}

void DisplaceVertexPosition_float(
    float3 vertexPositionOS,
    float3 normalOS,
    float radius,
    int sides,
    float height,
    float theta,
    float3 rk1,
    float3 rk2,
    float3 rk3,
    float3 rk4,
    float3 rk5,
    float3 rk6,
    out float3 finalVertexPositionOS,
    out float colorPosition,
    out float3 finalNormalOS
) {
    finalVertexPositionOS = vertexPositionOS;

    float thornsDisplacement = min(1,
        thorns(
            rotate(rk1.xy, vertexPositionOS).xy,
            radius,
            sides,
            rk1.z
        ) +
        thorns(
            rotate(rk2.xy, vertexPositionOS).xy,
            radius,
            sides,
            rk2.z
        ) +
        thorns(
            rotate(rk3.xy, vertexPositionOS).xy,
            radius,
            sides,
            rk3.z
        ) +
        thorns(
            rotate(rk4.xy, vertexPositionOS).xy,
            radius,
            sides,
            rk4.z
        ) +
        thorns(
            rotate(rk5.xy, vertexPositionOS).xy,
            radius,
            sides,
            rk5.z
        ) +
        thorns(
            rotate(rk6.xy, vertexPositionOS).xy,
            radius,
            sides,
            rk6.z
        )
    );

    colorPosition = thornsDisplacement;

    finalVertexPositionOS += height * thornsDisplacement * normalize(normalOS);

    torque(finalVertexPositionOS, normalOS, theta, 1, finalVertexPositionOS, finalNormalOS);
}

#endif