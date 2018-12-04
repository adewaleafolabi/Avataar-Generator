import "enums.dart";
import 'methods/clothes.dart';
import 'methods/face.dart';
import 'methods/tops.dart';

void main() {
  print(getSvg());
}

String getSvg() {
  return """
  <svg
        width="264px"
        height="280px"
        viewBox="0 0 264 280"
        version="1.1"
        xmlns="http://www.w3.org/2000/svg"
        xmlns:link="http://www.w3.org/1999/xlink">
        <desc>Created by devslane.com</desc>
        <defs>
          <circle id="path-1" cx="120" cy="120" r="120" />
          <path
            d="M12,160 C12,226.27417 65.72583,280 132,280 C198.27417,280 252,226.27417 252,160 L264,160 L264,-1.42108547e-14 L-3.19744231e-14,-1.42108547e-14 L-3.19744231e-14,160 L12,160 Z"
            id="path-3"
          />
          <path
            d="M124,144.610951 L124,163 L128,163 L128,163 C167.764502,163 200,195.235498 200,235 L200,244 L0,244 L0,235 C-4.86974701e-15,195.235498 32.235498,163 72,163 L72,163 L76,163 L76,144.610951 C58.7626345,136.422372 46.3722246,119.687011 44.3051388,99.8812385 C38.4803105,99.0577866 34,94.0521096 34,88 L34,74 C34,68.0540074 38.3245733,63.1180731 44,62.1659169 L44,56 L44,56 C44,25.072054 69.072054,5.68137151e-15 100,0 L100,0 L100,0 C130.927946,-5.68137151e-15 156,25.072054 156,56 L156,62.1659169 C161.675427,63.1180731 166,68.0540074 166,74 L166,88 C166,94.0521096 161.51969,99.0577866 155.694861,99.8812385 C153.627775,119.687011 141.237365,136.422372 124,144.610951 Z"
            id="path-5"
          />
        </defs>
        <g
          id="Avataaar"
          stroke="none"
          stroke-width="1"
          fill="none"
          fill-rule="evenodd">
          <g
            transform="translate(-825.000000, -1100.000000)"
            id="Avataaar/Circle">
            <g transform="translate(825.000000, 1100.000000)">
                <g
                  id="Circle"
                  stroke-width="1"
                  fill-rule="evenodd"
                  transform="translate(12.000000, 40.000000)">
                  <mask id="mask-2" fill="white">
                    <use xlink:href="#path-1" />
                  </mask>
                  <use
                    id="Circle-Background"
                    fill="#E6E6E6"
                    xlink:href="#path-1"
                  />
                  <g
                    id="Color/Palette/Blue-01"
                    mask="url(#mask-2)"
                    fill="#65C9FF">
                    <rect id="🖍Color" x="0" y="0" width="240" height="240" />
                  </g>
                </g>
                <mask id="mask-4" fill="white">
                  <use xlink:href="#path-3" />
                </mask>
              <g id="Mask" />
              <g
                id="Avataaar"
                stroke-width="1"
                fill-rule="evenodd"
                mask="url(#mask-4)">
                <g id="Body" transform="translate(32.000000, 36.000000)">
                  <mask id="mask-6" fill="white">
                    <use xlink:href="#path-5" />
                  </mask>
                  <use fill="#D0C6AC" xlink:href="#path-5" />""" +
      skinSvg() +
      """
                  <path
                    d="M156,79 L156,102 C156,132.927946 130.927946,158 100,158 C69.072054,158 44,132.927946 44,102 L44,79 L44,94 C44,124.927946 69.072054,150 100,150 C130.927946,150 156,124.927946 156,94 L156,79 Z"
                    id="Neck-Shadow"
                    fill-opacity="0.100000001"
                    fill="#000000"
                    mask="url(#mask-6)"
                  />
                </g>
                """ +
      getClothSvg() +
      faceSvg() +
      topSVG(Top.nohair) +
      """
              </g>
            </g>
          </g>
        </g>
      </svg>""";
}

String skinSvg(Skin skin, String maskId) {
  switch (skin) {
    case Skin.tanned:
      return makeColor("#FD9841", maskId);
    case Skin.yellow:
      return makeColor("#F8D25C", maskId);
    case Skin.pale:
      return makeColor("#FFDBB4", maskId);
    case Skin.light:
      return makeColor("#EDB98A", maskId);
    case Skin.brown:
      return makeColor("#D08B5B", maskId);
    case Skin.darkBrown:
      return makeColor("#AE5D29", maskId);
    case Skin.black:
      return makeColor("#614335", maskId);
    default:
      return "";
  }
}

String faceSvg(Mouth mouth, Eyes eyes, Eyebrow eyeBrow) {
  return """<g id="Face" transform="translate(76.000000, 82.000000)" fill="#000000">""" +
      mouthSvg(mouth) +
      noseSvg() +
      eyesSvg(eyes) +
      eyebrowSvg(eyeBrow) +
      """</g>
      """;
}

class Options {
  AvatarStyle style;
  Top top;
  Accessories accessories;
  HairColor hairColor;
  FacialHair facialHair;
  Cloth clothes;
  ClothColor clothColor;
  Eyes eyes;
  Eyebrow eyebrow;
  Mouth mouth;
  Skin skin;

  Options() {
    style = AvatarStyle.circle;
    top = Top.nohair;
    accessories = Accessories.blank;
    hairColor = HairColor.aurburn;
    facialHair = FacialHair.beardlight;
    clothes = Cloth.blazerShirt;
    clothColor = ClothColor.black;
    eyes = Eyes.close;
    eyebrow = Eyebrow.angry;
    mouth = Mouth.concerned;
    skin = Skin.black;
  }
}

String makeColor(String hex, String maskId) {
  return """
  <g
          id='Color/Palette/Gray-01'
          mask='url(#${maskId})'
          fill-rule='evenodd'
          fill=${hex}>
          <rect id='🖍Color' x='0' y='0' width='264' height='110' />
        </g>""";
}