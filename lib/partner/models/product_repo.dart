library my_prj.globals;

import 'product.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    var allProducts = [
      Product(
          price: 0.0,
          id: 0,
          name: 'gillette vector shaving cartridge twin blades 6 pcs.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 1,
          name:
              'colgate barbie strawberry flavor kids toothpaste 80 g 6 years .jpeg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 2,
          name:
              'garnier color naturals cream hair color darkest brown 3 100 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 3,
          name: 'listerine cool mint mouthwash 250 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 4,
          name: 'super max smx 3 razor blade 10 cartridge.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 5,
          name: 'engage men urge deodorant 150 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 6,
          name: 'himalaya purifying neem face wash 150 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 7,
          name: 'supermax 3blade disposable comfort grip womens 5 pp.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 8,
          name: 'mother care baby wipes 60 pcs with fragrance.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 9,
          name: 'johnson s baby soap 150 gm.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 10,
          name: 'fiama lemongrass jojoba shower gel 200 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 11,
          name: 'dove cream beauty bathing soap 100 g pack of 3.jpg',
          category: Category.pc),
      Product(
          price: 0.0, id: 12, name: 'hair removal.png', category: Category.pc),
      Product(
          price: 0.0,
          id: 13,
          name: 'gillette guard razor cartridge 6 pcs.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 14,
          name: 'whisper ultra clean sanitary napkin with wings xl 30 pads.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 15,
          name:
              'park avenue signature collection voyage perfume spray 167 gm.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 16,
          name: 'clean clear oil free foaming face wash 100 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 17,
          name: 'fair lovely instant glow clean up fairness face wash 50 g.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 18,
          name: 'kamasutra spark power series perfume spray 135 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 19,
          name: 'bajaj almond drops non sticky hair oil 300 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 20,
          name: 'everyuth exfoliating walnut apricot scrub 100 gm.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 21,
          name: 'himalaya baby powder 200 g.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 22,
          name: 'pears pure gentle soap with natural oils 125 g pack of 3.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 23,
          name: 'dettol original liquid hand wash refill 175 ml.jpeg',
          category: Category.pc),
      Product(price: 0.0, id: 24, name: 'diapers.png', category: Category.pc),
      Product(
          price: 0.0,
          id: 25,
          name: 'colgate slim soft charcoal soft pack of 2 .jpeg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 26,
          name:
              'veet silk fresh hair removal cream for sensitive skin 50 gm.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 28,
          name: 'nivea men fresh active roll on deodorant 50 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0, id: 29, name: 'pain reliever.png', category: Category.pc),
      Product(
          price: 0.0,
          id: 30,
          name: 'nivea cr me 100 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 31,
          name: 'pantene pro v advanced hair fall control shampoo 650 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 32,
          name: 'hair oil serum.png',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 33,
          name: 'hair cream gel.png',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 34,
          name: 'nivea all purpose soft cr me 50 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 35,
          name: 'baby soaps shampoo.png',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 36,
          name: 'head shoulders anti hairfall anti dandruff shampoo 180 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 37,
          name: 'dove daily shine shampoo 340 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 38,
          name:
              'lifebuoy total 10 handwash refill 750 ml pouch buy 1 get 1.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 39,
          name: 'colgate strong teeth dental cream toothpaste 48 g.jpeg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 40,
          name: 'garnier micellar cleansing water 125 ml.jpg',
          category: Category.pc),
      Product(price: 0.0, id: 41, name: 'roll on.png', category: Category.pc),
      Product(
          price: 0.0,
          id: 42,
          name: 'himalaya sparkling white toothpaste 80 gm.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 43,
          name: 'colgate active salt toothpaste 100 g.jpeg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 44,
          name:
              'clean clear morning energy energizing lemon face wash 100 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 45,
          name: 'godrej no 1 lime aloe vera soap 100 g pack of 4 .jpeg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 46,
          name:
              'pantene pro v advanced hair fall solution silky smooth care shampoo 675 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 47,
          name: 'gillette series sensitive skin shave gel 60 g.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 48,
          name: 'veet silk fresh hair removal cream for normal skin 50 gm.jpg',
          category: Category.pc),
      Product(price: 0.0, id: 49, name: 'body care.png', category: Category.pc),
      Product(
          price: 0.0, id: 50, name: 'toothbrush.png', category: Category.pc),
      Product(
          price: 0.0,
          id: 51,
          name: 'l oreal casting creme gloss hair colour dark brown 300.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 52,
          name: 'whisper choice sanitary napkin with wings xl 20 pads.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 53,
          name: 'fogg marco fragrance body spray for men 150 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 54,
          name:
              'nivea body milk nourishing lotion for very dry skin 200 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 55,
          name: 'johnson s baby soap 100 gm pack of 4.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 56,
          name: 'johnson s baby skincare wipes 80 pcs.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 57,
          name: 'dettol cool soap with crispy menthol 75 g pack of 4.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 58,
          name: 'listerine cavity fighter mouthwash 80 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 59,
          name: 'dabur lal tail 200 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 60,
          name: 'dove intense repair shampoo 650 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 61,
          name:
              'parachute advansed aloe vera enriched coconut hair oil 150 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 62,
          name: 'baby powder oil lotions.png',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 63,
          name: 'nivea men sensitive after shave lotion 100 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 64,
          name: 'engage women blush deodorant 150 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 65,
          name: 'nivea pearl beauty roll on deodorant 50 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 66,
          name: 'fogg paradise fragrant body spray for women 150 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 67,
          name:
              'colgate batman bubble fruit flavor kids toothpaste 80 g 6 years.jpg',
          category: Category.pc),
      Product(
          price: 0.0, id: 68, name: 'shaving care.png', category: Category.pc),
      Product(
          price: 0.0,
          id: 69,
          name: 'gillette venus women razor with aloe glide strips.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 70,
          name: 'engage women spell deodorant 150 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 71,
          name: 'pampers baby dry pants s 58 count 4 8 kg.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 72,
          name: 'lux international creamy perfection bar soap 125 g.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 73,
          name:
              'garnier men oil clear clay d tox deep cleansing icy face wash 100 gm.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 74,
          name: 'nivea all purpose soft cr me 100 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 75,
          name: 'moov pain relief specialist spray 35 g.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 76,
          name: 'head shoulders anti hairfall anti dandruff shampoo 340 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 77,
          name: 'himalaya baby lotion 100 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 78,
          name: 'fogg extreme fragrance body spray for men 120 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 79,
          name: 'supermax shaving foam 400ml classic.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 80,
          name: 'himalaya gentle baby soap 125 g.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 81,
          name: 'hand wash sanitizers.png',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 82,
          name: 'boroplus antiseptic cream 80 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 83,
          name: 'get real glycerine shower gel 250 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 84,
          name:
              'nivea whitening smooth skin roll on deodorant for women 50 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 85,
          name: 'wild stone men deo red 225 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 86,
          name:
              'colgate max fresh cooling crystal peppermint ice toothpaste 150 gm.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 87,
          name:
              'nivea men oil control all in 1 face wash with cooling menthol 100 gm.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 88,
          name: 'dove hair fall rescue shampoo 340 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 89,
          name: 'carefree super dry panty liner 20 pcs.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 90,
          name: 'park avenue signature collection neo perfume spray 220 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 91,
          name: 'everyuth advanced golden glow peel off mask 50 gm.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 92,
          name: 'head shoulders anti hairfall anti dandruff shampoo 650 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 93,
          name:
              'l oreal paris total repair 5 advanced repairing shampoo 640 ml with extra 10.jpg',
          category: Category.pc),
      Product(
          price: 0.0, id: 94, name: 'hair color.png', category: Category.pc),
      Product(
          price: 0.0,
          id: 95,
          name: 'kamasutra spark men deodorant spray 250 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 96,
          name: 'mirabelle korea papaya fairness facial mask.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 97,
          name: 'mysore sandal soap 150 gm.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 98,
          name: 'godrej no 1 sandal turmeric soap 100 gm pack of 4.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 99,
          name: 'get real lavender talcum powder 100 g 50 off on 1 unit.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 100,
          name:
              'petals ultra comfort sanitary napkins with wings xl 30 pads.jpeg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 101,
          name: 'gillette mach3 turbo shaving cartridge 3 blades 4 pcs.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 102,
          name:
              'himalaya gentle baby no tears shampoo with hibiscus chickpea 200 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 103,
          name: 'himalaya baby massage oil 200 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 104,
          name: 'head shoulders cool menthol anti dandruff shampoo 650 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 105,
          name: 'head shoulders cool menthol anti dandruff shampoo 170 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0, id: 106, name: 'toothpaste.png', category: Category.pc),
      Product(
          price: 0.0,
          id: 107,
          name: 'dettol cool soap with crispy menthol 125 g pack of 4 .jpeg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 108,
          name: 'fogg napoleon fragrance body spray for men 150 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 109,
          name:
              'garnier color naturals cream hair color natural black 1 100 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 110,
          name: 'palmolive aroma morning tonic shower gel 250 ml.jpeg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 111,
          name: 'shower gel body wash.png',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 112,
          name: 'mysore sandal soap 75 gm.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 113,
          name: 'sanitary napkins.png',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 114,
          name: 'fogg dynamic fragrance body spray for men 120 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 115,
          name: 'head shoulders smooth silky anti dandruff shampoo 650 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 116,
          name: 'colgate zig zag medium toothbrush pack of 2 .jpeg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 117,
          name: 'set wet las vegas perfume spray 120 ml cbd.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 118,
          name: 'fogg fantastic absolute fragrance body spray 120 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 119,
          name: 'himalaya purifying neem face wash 50 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 120,
          name:
              'garnier men powerwhite anti pollution double action face wash 100 gm.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 121,
          name: 'fiama multivariant gel bar 125 g pack of 4.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 122,
          name: 'moov pain relief cream 50 g.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 123,
          name: 'santoor sandal almond milk soap 115 g pack of 4.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 124,
          name: 'gillette vector plus manual shaving razor twin blades.jpg',
          category: Category.pc),
      Product(
          price: 0.0, id: 125, name: 'mouthwash.png', category: Category.pc),
      Product(
          price: 0.0,
          id: 126,
          name: 'nivea men cool kick deodorant 150 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 127,
          name:
              'stayfree dry max all night ultra thin sanitary napkin with wings xl 28 pads.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 128,
          name: 'santoor orange soap 125 gm pack of 4.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 129,
          name:
              'colgate max fresh spicy fresh red gel anticavity toothpaste 150 g.jpeg',
          category: Category.pc),
      Product(price: 0.0, id: 130, name: 'perfumes.png', category: Category.pc),
      Product(
          price: 0.0,
          id: 131,
          name: 'gillette mach3 shaving cartridge 3 blades 2 pcs.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 132,
          name: 'parachute 100 pure coconut oil 500 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 133,
          name: 'parachute 100 pure coconut oil 100 ml.jpeg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 134,
          name: 'gillette regular shaving cream 93 g.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 135,
          name: 'clean clear oil free foaming face wash 150 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 136,
          name: 'himalaya extra moisturizing baby soap 75 g.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 137,
          name:
              'colgate strong teeth dental cream toothpaste 200 g pack of 2 .jpeg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 138,
          name: 'godrej protekt masterblaster handwash refill 750 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 139,
          name: 'nivea protect care deodorant 150 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 140,
          name:
              'parachute advansed aloe vera enriched coconut hair oil 250 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 141,
          name: 'santoor orange soap 150 gm pack of 4.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 142,
          name: 'johnson s baby shampoo 200 ml.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 143,
          name: 'whisper ultra soft sanitary napkin with wings xl 15 pads.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 144,
          name: 'himalaya baby diaper rash cream with almond oil 50 g.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 145,
          name: 'mysore sandal soap 150 g pack of 3.jpg',
          category: Category.pc),
      Product(
          price: 0.0, id: 146, name: 'panty liners.png', category: Category.pc),
      Product(
          price: 0.0,
          id: 147,
          name: 'medimix ayurvedic classic soap 125 gm pack of 3 .jpeg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 148,
          name: 'garnier men acno fight anti pimple face wash 50 gm.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 149,
          name: 'mysore sandal soap 125 gm.jpg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 150,
          name: 'shampoo conditioner.png',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 151,
          name: 'cleanser make up remover.png',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 152,
          name: 'santoor classic handwash refill 750 ml.jpeg',
          category: Category.pc),
      Product(
          price: 0.0,
          id: 154,
          name: 'durex extra ribbed condoms 10 pcs.jpg',
          category: Category.misc),
      Product(
          price: 0.0,
          id: 155,
          name: 'dettol original soap 125 gm x4 wrp.jpg',
          category: Category.misc),
      Product(
          price: 0.0,
          id: 156,
          name: 'safe life floral blossom handwash 750 ml pp.png',
          category: Category.misc),
      Product(
          price: 0.0,
          id: 157,
          name: 'dettol original soap 75 g pack of 4.jpg',
          category: Category.misc),
      Product(
          price: 0.0,
          id: 158,
          name: 'dettol original soap 70 gm.jpg',
          category: Category.misc),
      Product(
          price: 0.0,
          id: 159,
          name: 'durex extra thin condoms 10 pcs.jpg',
          category: Category.misc),
      Product(
          price: 0.0,
          id: 160,
          name: 'safe life aqueous fresh handwash 750 ml.jpeg',
          category: Category.misc),
      Product(
          price: 0.0,
          id: 161,
          name: 'lifebuoy total 10 soap 125 g pack of 4.jpg',
          category: Category.misc),
      Product(
          price: 0.0,
          id: 162,
          name: 'ariel complete detergent powder 500 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 163,
          name: 'everest coriander powder 100 g.jpeg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 164,
          name: 'madam nachni millet flour 500 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0, id: 165, name: 'rawa 500 g.jpg', category: Category.ke),
      Product(
          price: 0.0,
          id: 166,
          name: 'vanish oxi action stain remover liquid 400 ml.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 167,
          name: 'daawat rozana super basmati rice 1 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 168,
          name: 'henko matic front load detergent powder 2 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0, id: 169, name: 'detergents.jpg', category: Category.ke),
      Product(
          price: 0.0,
          id: 170,
          name: 'detergent powder liquid.png',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 171,
          name: 'masti sihori wheat 10 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 172,
          name: 'powdered spices.png',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 173,
          name: 'shree embly 200 gm.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 175,
          name: 'fortune rice bran oil 1 l.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 176,
          name: 'good life kabuli chana 500 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 177,
          name: 'everest tikhalal chilli powder 200 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0, id: 178, name: 'maida 500 g.jpg', category: Category.ke),
      Product(
          price: 0.0,
          id: 179,
          name: 'good life rajma red 500 gm pp.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 180,
          name: 'ariel matic top load detergent powder 4 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 181,
          name: 'red label leaf tea 1 kg.jpeg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 182,
          name: 'surti kolam rice 10 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 183,
          name: 'daawat devaaya basmati rice 5 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 184,
          name: 'tata sampann high protein unpolished moong dal 500 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 185,
          name: 'good life moong whole 500 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 186,
          name: 'surf excel matic front load detergent powder 4 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 187,
          name: 'riso physically refined rice bran oil 5 l jar.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 188,
          name: 'tomato ketchup sauces.png',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 189,
          name: 'loose toor dal value 1 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 190,
          name: 'surf excel matic top load detergent powder 4 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 191,
          name: 'leaf dust tea.png',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 192,
          name: 'good life mp wheat chakki atta 5 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 193,
          name: 'tetley lemon honey green tea bags 30 pcs.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 194,
          name: 'fabric pre post wash.png',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 195,
          name: 'fortune sun lite refined sunflower oil 5 l jar.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 196,
          name: 'saffola gold ricebran based blended oil 1 l pouch.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 197,
          name: 'daawat devaaya basmati rice 1 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 198,
          name: 'good life s fennel 100 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 199,
          name: 'ariel matic front load detergent powder 4 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 200,
          name: 'good life black pepper 50 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 201,
          name: 'godrej ezee liquid detergent 500 gm.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 202,
          name: 'society tea 1 kg.jpeg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 203,
          name: 'mtr instant gulab jamun mix 175 g 50 off on 1 unit.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 204,
          name: 'good life sugar m 2 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0, id: 205, name: 'sugar m 1 kg.jpg', category: Category.ke),
      Product(
          price: 0.0,
          id: 206,
          name: 'enzo matic front load detergent powder 6 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 207,
          name: 'sugar free natura sugar substitue 100 gm.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 208,
          name: 'aashirvaad whole wheat atta 10 kg.jpeg',
          category: Category.ke),
      Product(
          price: 0.0, id: 209, name: 'maida 1 kg.jpg', category: Category.ke),
      Product(
          price: 0.0,
          id: 210,
          name: 'good life turmeric powder 100 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 211,
          name: 'enzo matic top load carton box 2kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 212,
          name: 'good life jeera 200 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 213,
          name:
              'enzo matic front load liquid detergent 500 ml buy 1 get 1 free .jpeg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 214,
          name: 'dabur chyawanprash with awaleha 1 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 215,
          name: 'dessert mixes.png',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 216,
          name: 'taj mahal tea 250 g carton .jpeg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 217,
          name: 'tata gold tea 250 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 218,
          name: 'pick n cook white urad gota 500 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 219,
          name: 'daawat brown basmati rice 1 kg.jpeg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 220,
          name: 'enzo matic top load detergent powder 6 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 221,
          name: 'good life mp wheat chakki atta 10 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 222,
          name: 'sunrich refined sunflower oil 1 l pouch.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 223,
          name: 'madhur pure hygienic sugar 5 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 224,
          name: 'suhana meat mutton masala 50 gm.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 225,
          name: 'trust classic sulphurless sugar 1 kg.jpeg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 226,
          name: 'super sarvottam rice bran oil 1 l pouch.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 227,
          name: 'rawa sooji 1 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 228,
          name: 'mtr rice idli mix 500 gm.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 229,
          name: 'good life coriander powder 100 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 230,
          name: 'good life sugar m 5 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 231,
          name: 'dishwash bars powders.png',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 232,
          name: 'aarambh danedar assam tea 1 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 233,
          name: 'loose chana dal 1 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 234,
          name: 'mtr instant rava idli mix 1 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 235,
          name: 'good life urad dal chilka 500 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 236,
          name: 'daawat rozana gold basmati rice 5 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 237,
          name: 'aashirvaad pure iodised salt 1 kg.jpeg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 238,
          name: 'ariel matic front load detergent powder 1 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 239,
          name: 'society tea 500 g.jpeg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 240,
          name: 'revive liquid stiffener 400 gm.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 241,
          name: 'surf excel matic top load detergent powder 1 kg.jpg',
          category: Category.ke),
      Product(price: 0.0, id: 242, name: 'atta.png', category: Category.ke),
      Product(
          price: 0.0,
          id: 243,
          name: 'detergent bars.png',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 244,
          name: 'madam roasted rawa sooji 500 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 245,
          name: 'exo touch shine round dishwash bar 500 gm.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 246,
          name: 'mtr 3 minute breakfast instant poha mix 60 g.jpeg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 247,
          name: 'best farms green cardamom 50 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 248,
          name: 'henko matic front load detergent powder 1 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 249,
          name: 'pick n cook moong chilka 500 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 250,
          name: 'aashirvaad superior mp whole wheat atta 5 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0, id: 251, name: 'whole spices.png', category: Category.ke),
      Product(
          price: 0.0,
          id: 252,
          name: 'kissan fresh tomato ketchup 950 g.jpeg',
          category: Category.ke),
      Product(
          price: 0.0, id: 253, name: 'besan 1 kg.jpg', category: Category.ke),
      Product(
          price: 0.0,
          id: 254,
          name: 'safewash matic top load refill 2 l pouch.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 255,
          name: 'weikfield vanilla custard powder 100 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 256,
          name: 'tata iodised salt 1 kg.jpeg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 257,
          name: 'aashirvaad whole wheat atta 1 kg.jpeg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 258,
          name: 'patanjali lemon and wood ash super dishwash bar 175 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 259,
          name: 'loose hmt kolam rice 1 kg.png',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 260,
          name: 'india gate classic basmati rice 1 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 261,
          name: 'masti lokwan wheat 10 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 262,
          name: 'good life chilli powder 100 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 263,
          name: 'tide plus jasmine rose detergent powder 500 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 264,
          name: 'parth jaggery powder 500 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 265,
          name: 'breakfast snack mixes.png',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 266,
          name:
              'fortune rice bran health physically refined rice bran oil 5 l jar.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 267,
          name: 'everest shahi biryani masala 50 g.jpeg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 268,
          name: 'mtr rava dosa mix 500 gm.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 269,
          name: 'blended masalas.png',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 270,
          name: 'best farms premium moth beans 500 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 271,
          name: 'patanjali herbo wash detergent powder 1 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0, id: 272, name: 'besan 500 g.jpg', category: Category.ke),
      Product(
          price: 0.0,
          id: 273,
          name: 'loose moong dal 1 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 274,
          name: 'good life free flow iodised salt 1 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 275,
          name: 'everest turmeric powder 200 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 276,
          name: 'enzo matic front load detergent powder 2 kg.jpeg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 277,
          name: 'hmt kolam rice 10 kg.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 278,
          name: 'tata sampann high protein moong whole 500 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 279,
          name: 'good life big fennel 200 g.jpg',
          category: Category.ke),
      Product(
          price: 0.0,
          id: 280,
          name: 'milk wheat multigrain bread.png',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 281,
          name: 'britannia cheese slice plain 200 gm pp.png',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 282,
          name: 'muffets tuffets fruit bun 150 g.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 283,
          name: 'muffets tuffets pizza base 2ea 180 g.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 284,
          name: 'butter margarine.png',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 286,
          name: 'amul cheese slice plain 200 gm pp.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 287,
          name: 'gowardhan plain cheese slices 476 g pouch.jpg',
          category: Category.dnb),
      Product(price: 0.0, id: 288, name: 'ghee.png', category: Category.dnb),
      Product(
          price: 0.0,
          id: 289,
          name: 'britannia chesse slice plain 480 gm pp.png',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 290,
          name: 'muffets tuffets burger bun 150 g.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 291,
          name: 'nandini goodlife toned long life milk 1 l tetra pak.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 292,
          name: 'brita m m cheese cake 200gm pet.png',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 293,
          name: 'britannia cheese cubes 200 g carton.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 294,
          name: 'maida pizza base bread 250 gm.jpg',
          category: Category.dnb),
      Product(price: 0.0, id: 295, name: 'milk.png', category: Category.dnb),
      Product(
          price: 0.0,
          id: 296,
          name: 'muffets tuffets ladipav 180 g.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 297,
          name: 'muffets tuffets multigrain bread 400 gm.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 298,
          name: 'buttermilk and lassi.png',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 299,
          name: 'gowardhan fresh paneer 200 g.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 300,
          name: 'britannia cheese block 400 gm cbd.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 301,
          name: 'parle real elaichi premium rusk 200 g.jpeg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 302,
          name: 'amul pasteurised butter 100 g.jpeg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 303,
          name: 'wibs bread 400 g.jpg',
          category: Category.dnb),
      Product(
          price: 0.0, id: 304, name: 'paneer tofu.png', category: Category.dnb),
      Product(
          price: 0.0,
          id: 305,
          name: 'britannia pav 200 gm.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 306,
          name: 'amul paneer fresh 200 gm pp.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 307,
          name: 'muffets and tuffets white bread 400 gm.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 308,
          name: 'amul pure ghee 1 l pouch.jpg',
          category: Category.dnb),
      Product(price: 0.0, id: 309, name: 'cheese.png', category: Category.dnb),
      Product(
          price: 0.0,
          id: 310,
          name: 'amul masti spiced buttermilk 1 l tetra pak .jpeg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 311,
          name: 'gowardhan pure cow ghee 1 l pouch.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 312,
          name: 'muffets tuffets whole wheat bread 400 gm.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 313,
          name: 'burger bun with sesame seed 200 gm.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 314,
          name: 'amul pasteurised butter 500 g.jpeg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 315,
          name: 'flavoured milk.png',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 316,
          name: 'britannia 100 whole wheat bread 400 g.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 317,
          name: 'milk powder cream.png',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 318,
          name: 'freshly baked rusk 200gm.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 319,
          name: 'britannia cheezza 200 g carton.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 320,
          name:
              'amul gold homogenised standardised long life milk 1 l tetra pak .jpeg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 321,
          name: 'wibs browny bread 400 gm.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 322,
          name: 'muffets tuffets brown bread 400 gm.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 323,
          name: 'nestle everyday dairy whitener 1kg pouch.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 324,
          name:
              'amul taaza homogenised toned long life milk 1 l tetra pak .jpeg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 325,
          name: 'amul masti dahi 1 kg pouch.jpg',
          category: Category.dnb),
      Product(
          price: 0.0,
          id: 326,
          name: 'dukes waffy chocolate flavoured wafers 75 g.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 327,
          name: 'parle krack jack biscuits 400 g.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 328,
          name: 'taj mahal tea 250 g carton.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 329,
          name: 'parle g original glucose biscuits 800 g.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 331,
          name: 'pediasure chocolate health drink powder 200 gm.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 332,
          name: 'red label leaf tea 1 kg.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 333,
          name: 'amul pro chocolate 500 g.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 334,
          name: 'good life w320 cashews 500 g.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 335,
          name: 'parle monaco classic regular salted biscuits 400 g.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 336,
          name: 'bournvita 750 g.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 337,
          name: 'garden mumbai special diet bhel 150 gm.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 338,
          name: 'tetley lemon honey green tea bags 30 pcs.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 339,
          name: 'kaffe pure instant coffee 50 buy 1 get 1.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 340,
          name: 'coca cola 600 ml.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 341,
          name: 'pediasure chocolate health drink powder 400 gm.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 342,
          name: 'sprite 600 ml.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 343,
          name: 'society tea 1 kg.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 344,
          name: 'kaffe blended instant coffee 50 g buy 1 get 1.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 345,
          name: 'top ramen new masala instant noodles 420 g.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 346,
          name: 'thums up 600 ml.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 347,
          name: 'parle krack jack biscuits 200 g.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 348,
          name: 'bournvita 500 g pouch.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 349,
          name: 'cadbury bournvita health drink powder 1 kg.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 350,
          name: 'tata gold tea 250 g.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 351,
          name: 'act ii golden sizzle instant popcorn 90 g.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 352,
          name: 'saffola veggie twist instant masala oats 38 g.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 353,
          name: 'lay s india s magic masala potato chips 90 g.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 354,
          name: 'good life almonds 500 g.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 355,
          name: 'protinex vanilla delight 400 g.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 356,
          name: 'parle g gold biscuits 1 kg.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 357,
          name: 'red bull energy drink 250 ml can.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 358,
          name: 'complan royal chocolate health drink powder 500 gm.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 359,
          name: 'society tea 500 g.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 360,
          name: 'pedia sure vanilla health drink powder 200 gm.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 361,
          name: 'maggi 2 minute masala instant noodles 70 g.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 362,
          name: 'saffola peppy tomato masala oats 39 gm.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 363,
          name: 'parle g 110 gm pls20 gm extra pack.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 364,
          name: 'parle g original glucose biscuits 250 g.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 365,
          name: 'parle hide seek chocolate chip cookies 100 gm.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 366,
          name: 'sunfeast dark fantasy bourbon biscuits 150 g.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 367,
          name: 'parle monaco biscuits 75 4 g.jpg',
          category: Category.snd),
      Product(price: 0.0, id: 368, name: 'tea.jpg', category: Category.snd),
      Product(
          price: 0.0,
          id: 369,
          name: 'parle g biscuits 55 g.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 370,
          name: 'frooti mango drink 2 25 l.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 371,
          name: 'britannia good day cashew cookies 600 g.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 372,
          name: 'bhikharam chandmal bikaneri bhujia 1 kg.jpeg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 373,
          name: 'kellogg s corn flakes 1 2 kg.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 374,
          name: 'monster energy drink 350 ml can.jpg',
          category: Category.snd),
      Product(
          price: 0.0,
          id: 375,
          name: 'eveready red 1012 aaa carbon zinc batteries pack of 10.jpg',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 376,
          name:
              'colin glass cleaner pump 2x more shine with shine boosters 500ml.jpg',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 377,
          name: 'multipurpose kitchen cloth 15 x 15 pack of 3.jpg',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 378,
          name: 'scrubz nylon scrubber 3 pcs.jpg',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 379,
          name: 'eveready red 1015 aa carbon zinc batteries pack of 10.jpg',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 380,
          name: 'patanjali gonyle floor cleaner 1 ltr.jpg',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 382,
          name: 'dust cloth wipes.png',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 383,
          name: 'lizol power bathroom cleaner trigger 450 ml.jpg',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 384,
          name: 'puric paper napkin 100 pcs.jpg',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 385,
          name: 'scrubz stainless steel scrubber 50 off on 1 unit.jpg',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 386,
          name:
              'lizol disinfectant surface floor cleaner liquid citrus 500 ml.jpg',
          category: Category.hhi),
      Product(
          price: 0.0, id: 387, name: 'scrub pad.png', category: Category.hhi),
      Product(
          price: 0.0,
          id: 388,
          name: 'paper tissues nakins.png',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 389,
          name: 'gala super scrub 10 cm x 10 cm.jpg',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 390,
          name: 'puric toilet paper roll 235 pulls pack of 4.jpg',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 391,
          name: 'kitchen toilet rolls.png',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 392,
          name: 'white knight cocktail paper napkins 30 cm x 30 cm 100 pcs.jpg',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 393,
          name: 'lizol trigger power kitchen cleaner 450 ml.jpg',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 394,
          name: 'toilet cleaners.png',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 395,
          name: 'kitchen glass drain.png',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 396,
          name: 'home one grass broom.jpg',
          category: Category.hhi),
      Product(
          price: 0.0, id: 397, name: 'batteries.png', category: Category.hhi),
      Product(
          price: 0.0,
          id: 398,
          name: 'duracell ultra alkaline aa batteries pack of 4.jpg',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 399,
          name: 'puric facial tissues 100 pcs.jpg',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 400,
          name: 'mr muscle lemon kitchen cleaner spray 500 ml.jpg',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 401,
          name: 'gala no dust broom xl.jpg',
          category: Category.hhi),
      Product(
          price: 0.0,
          id: 402,
          name: 'duracell ultra alkaline aaa batteries pack of 4.jpg',
          category: Category.hhi)
    ];
    if (category == Category.all) {
      return allProducts;
    } else {
      return allProducts.where((Product p) {
        return p.category == category;
      }).toList();
    }
  }
}

// DEPRECATED LIST
// var products = [
//   {
//     id: 0,
//     name: 'gillette vector shaving cartridge twin blades 6 pcs.jpg',
//     category: Category.pc
//   },
//   {
//     id: 1,
//     name:
//         'colgate barbie strawberry flavor kids toothpaste 80 g 6 years .jpeg',
//     category: Category.pc
//   },
//   {
//     id: 2,
//     name:
//         'garnier color naturals cream hair color darkest brown 3 100 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 3,
//     name: 'listerine cool mint mouthwash 250 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 4,
//     name: 'super max smx 3 razor blade 10 cartridge.jpg',
//     category: Category.pc
//   },
//   {
//     id: 5,
//     name: 'engage men urge deodorant 150 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 6,
//     name: 'himalaya purifying neem face wash 150 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 7,
//     name: 'supermax 3blade disposable comfort grip womens 5 pp.jpg',
//     category: Category.pc
//   },
//   {
//     id: 8,
//     name: 'mother care baby wipes 60 pcs with fragrance.jpg',
//     category: Category.pc
//   },
//   id: 9, name: 'johnson s baby soap 150 gm.jpg', category: Category.pc},
//   {
//     id: 10,
//     name: 'fiama lemongrass jojoba shower gel 200 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 11,
//     name: 'dove cream beauty bathing soap 100 g pack of 3.jpg',
//     category: Category.pc
//   },
//   id: 12, name: 'hair removal.png', category: Category.pc},
//   {
//     id: 13,
//     name: 'gillette guard razor cartridge 6 pcs.jpg',
//     category: Category.pc
//   },
//   {
//     id: 14,
//     name: 'whisper ultra clean sanitary napkin with wings xl 30 pads.jpg',
//     category: Category.pc
//   },
//   {
//     id: 15,
//     name: 'park avenue signature collection voyage perfume spray 167 gm.jpg',
//     category: Category.pc
//   },
//   {
//     id: 16,
//     name: 'clean clear oil free foaming face wash 100 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 17,
//     name: 'fair lovely instant glow clean up fairness face wash 50 g.jpg',
//     category: Category.pc
//   },
//   {
//     id: 18,
//     name: 'kamasutra spark power series perfume spray 135 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 19,
//     name: 'bajaj almond drops non sticky hair oil 300 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 20,
//     name: 'everyuth exfoliating walnut apricot scrub 100 gm.jpg',
//     category: Category.pc
//   },
//   id: 21, name: 'himalaya baby powder 200 g.jpg', category: Category.pc},
//   {
//     id: 22,
//     name: 'pears pure gentle soap with natural oils 125 g pack of 3.jpg',
//     category: Category.pc
//   },
//   {
//     id: 23,
//     name: 'dettol original liquid hand wash refill 175 ml.jpeg',
//     category: Category.pc
//   },
//   id: 24, name: 'diapers.png', category: Category.pc},
//   {
//     id: 25,
//     name: 'colgate slim soft charcoal soft pack of 2 .jpeg',
//     category: Category.pc
//   },
//   {
//     id: 26,
//     name: 'veet silk fresh hair removal cream for sensitive skin 50 gm.jpg',
//     category: Category.pc
//   },
//   {
//     id: 28,
//     name: 'nivea men fresh active roll on deodorant 50 ml.jpg',
//     category: Category.pc
//   },
//   id: 29, name: 'pain reliever.png', category: Category.pc},
//   id: 30, name: 'nivea cr me 100 ml.jpg', category: Category.pc},
//   {
//     id: 31,
//     name: 'pantene pro v advanced hair fall control shampoo 650 ml.jpg',
//     category: Category.pc
//   },
//   id: 32, name: 'hair oil serum.png', category: Category.pc},
//   id: 33, name: 'hair cream gel.png', category: Category.pc},
//   {
//     id: 34,
//     name: 'nivea all purpose soft cr me 50 ml.jpg',
//     category: Category.pc
//   },
//   id: 35, name: 'baby soaps shampoo.png', category: Category.pc},
//   {
//     id: 36,
//     name: 'head shoulders anti hairfall anti dandruff shampoo 180 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 37,
//     name: 'dove daily shine shampoo 340 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 38,
//     name: 'lifebuoy total 10 handwash refill 750 ml pouch buy 1 get 1.jpg',
//     category: Category.pc
//   },
//   {
//     id: 39,
//     name: 'colgate strong teeth dental cream toothpaste 48 g.jpeg',
//     category: Category.pc
//   },
//   {
//     id: 40,
//     name: 'garnier micellar cleansing water 125 ml.jpg',
//     category: Category.pc
//   },
//   id: 41, name: 'roll on.png', category: Category.pc},
//   {
//     id: 42,
//     name: 'himalaya sparkling white toothpaste 80 gm.jpg',
//     category: Category.pc
//   },
//   {
//     id: 43,
//     name: 'colgate active salt toothpaste 100 g.jpeg',
//     category: Category.pc
//   },
//   {
//     id: 44,
//     name: 'clean clear morning energy energizing lemon face wash 100 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 45,
//     name: 'godrej no 1 lime aloe vera soap 100 g pack of 4 .jpeg',
//     category: Category.pc
//   },
//   {
//     id: 46,
//     name:
//         'pantene pro v advanced hair fall solution silky smooth care shampoo 675 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 47,
//     name: 'gillette series sensitive skin shave gel 60 g.jpg',
//     category: Category.pc
//   },
//   {
//     id: 48,
//     name: 'veet silk fresh hair removal cream for normal skin 50 gm.jpg',
//     category: Category.pc
//   },
//   id: 49, name: 'body care.png', category: Category.pc},
//   id: 50, name: 'toothbrush.png', category: Category.pc},
//   {
//     id: 51,
//     name: 'l oreal casting creme gloss hair colour dark brown 300.jpg',
//     category: Category.pc
//   },
//   {
//     id: 52,
//     name: 'whisper choice sanitary napkin with wings xl 20 pads.jpg',
//     category: Category.pc
//   },
//   {
//     id: 53,
//     name: 'fogg marco fragrance body spray for men 150 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 54,
//     name: 'nivea body milk nourishing lotion for very dry skin 200 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 55,
//     name: 'johnson s baby soap 100 gm pack of 4.jpg',
//     category: Category.pc
//   },
//   {
//     id: 56,
//     name: 'johnson s baby skincare wipes 80 pcs.jpg',
//     category: Category.pc
//   },
//   {
//     id: 57,
//     name: 'dettol cool soap with crispy menthol 75 g pack of 4.jpg',
//     category: Category.pc
//   },
//   {
//     id: 58,
//     name: 'listerine cavity fighter mouthwash 80 ml.jpg',
//     category: Category.pc
//   },
//   id: 59, name: 'dabur lal tail 200 ml.jpg', category: Category.pc},
//   {
//     id: 60,
//     name: 'dove intense repair shampoo 650 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 61,
//     name: 'parachute advansed aloe vera enriched coconut hair oil 150 ml.jpg',
//     category: Category.pc
//   },
//   id: 62, name: 'baby powder oil lotions.png', category: Category.pc},
//   {
//     id: 63,
//     name: 'nivea men sensitive after shave lotion 100 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 64,
//     name: 'engage women blush deodorant 150 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 65,
//     name: 'nivea pearl beauty roll on deodorant 50 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 66,
//     name: 'fogg paradise fragrant body spray for women 150 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 67,
//     name:
//         'colgate batman bubble fruit flavor kids toothpaste 80 g 6 years.jpg',
//     category: Category.pc
//   },
//   id: 68, name: 'shaving care.png', category: Category.pc},
//   {
//     id: 69,
//     name: 'gillette venus women razor with aloe glide strips.jpg',
//     category: Category.pc
//   },
//   {
//     id: 70,
//     name: 'engage women spell deodorant 150 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 71,
//     name: 'pampers baby dry pants s 58 count 4 8 kg.jpg',
//     category: Category.pc
//   },
//   {
//     id: 72,
//     name: 'lux international creamy perfection bar soap 125 g.jpg',
//     category: Category.pc
//   },
//   {
//     id: 73,
//     name:
//         'garnier men oil clear clay d tox deep cleansing icy face wash 100 gm.jpg',
//     category: Category.pc
//   },
//   {
//     id: 74,
//     name: 'nivea all purpose soft cr me 100 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 75,
//     name: 'moov pain relief specialist spray 35 g.jpg',
//     category: Category.pc
//   },
//   {
//     id: 76,
//     name: 'head shoulders anti hairfall anti dandruff shampoo 340 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 77,
//     name: 'himalaya baby lotion 100 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 78,
//     name: 'fogg extreme fragrance body spray for men 120 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 79,
//     name: 'supermax shaving foam 400ml classic.jpg',
//     category: Category.pc
//   },
//   {
//     id: 80,
//     name: 'himalaya gentle baby soap 125 g.jpg',
//     category: Category.pc
//   },
//   id: 81, name: 'hand wash sanitizers.png', category: Category.pc},
//   {
//     id: 82,
//     name: 'boroplus antiseptic cream 80 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 83,
//     name: 'get real glycerine shower gel 250 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 84,
//     name: 'nivea whitening smooth skin roll on deodorant for women 50 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 85,
//     name: 'wild stone men deo red 225 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 86,
//     name:
//         'colgate max fresh cooling crystal peppermint ice toothpaste 150 gm.jpg',
//     category: Category.pc
//   },
//   {
//     id: 87,
//     name:
//         'nivea men oil control all in 1 face wash with cooling menthol 100 gm.jpg',
//     category: Category.pc
//   },
//   {
//     id: 88,
//     name: 'dove hair fall rescue shampoo 340 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 89,
//     name: 'carefree super dry panty liner 20 pcs.jpg',
//     category: Category.pc
//   },
//   {
//     id: 90,
//     name: 'park avenue signature collection neo perfume spray 220 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 91,
//     name: 'everyuth advanced golden glow peel off mask 50 gm.jpg',
//     category: Category.pc
//   },
//   {
//     id: 92,
//     name: 'head shoulders anti hairfall anti dandruff shampoo 650 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 93,
//     name:
//         'l oreal paris total repair 5 advanced repairing shampoo 640 ml with extra 10.jpg',
//     category: Category.pc
//   },
//   id: 94, name: 'hair color.png', category: Category.pc},
//   {
//     id: 95,
//     name: 'kamasutra spark men deodorant spray 250 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 96,
//     name: 'mirabelle korea papaya fairness facial mask.jpg',
//     category: Category.pc
//   },
//   id: 97, name: 'mysore sandal soap 150 gm.jpg', category: Category.pc},
//   {
//     id: 98,
//     name: 'godrej no 1 sandal turmeric soap 100 gm pack of 4.jpg',
//     category: Category.pc
//   },
//   {
//     id: 99,
//     name: 'get real lavender talcum powder 100 g 50 off on 1 unit.jpg',
//     category: Category.pc
//   },
//   {
//     id: 100,
//     name: 'petals ultra comfort sanitary napkins with wings xl 30 pads.jpeg',
//     category: Category.pc
//   },
//   {
//     id: 101,
//     name: 'gillette mach3 turbo shaving cartridge 3 blades 4 pcs.jpg',
//     category: Category.pc
//   },
//   {
//     id: 102,
//     name:
//         'himalaya gentle baby no tears shampoo with hibiscus chickpea 200 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 103,
//     name: 'himalaya baby massage oil 200 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 104,
//     name: 'head shoulders cool menthol anti dandruff shampoo 650 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 105,
//     name: 'head shoulders cool menthol anti dandruff shampoo 170 ml.jpg',
//     category: Category.pc
//   },
//   id: 106, name: 'toothpaste.png', category: Category.pc},
//   {
//     id: 107,
//     name: 'dettol cool soap with crispy menthol 125 g pack of 4 .jpeg',
//     category: Category.pc
//   },
//   {
//     id: 108,
//     name: 'fogg napoleon fragrance body spray for men 150 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 109,
//     name:
//         'garnier color naturals cream hair color natural black 1 100 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 110,
//     name: 'palmolive aroma morning tonic shower gel 250 ml.jpeg',
//     category: Category.pc
//   },
//   id: 111, name: 'shower gel body wash.png', category: Category.pc},
//   id: 112, name: 'mysore sandal soap 75 gm.jpg', category: Category.pc},
//   id: 113, name: 'sanitary napkins.png', category: Category.pc},
//   {
//     id: 114,
//     name: 'fogg dynamic fragrance body spray for men 120 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 115,
//     name: 'head shoulders smooth silky anti dandruff shampoo 650 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 116,
//     name: 'colgate zig zag medium toothbrush pack of 2 .jpeg',
//     category: Category.pc
//   },
//   {
//     id: 117,
//     name: 'set wet las vegas perfume spray 120 ml cbd.jpg',
//     category: Category.pc
//   },
//   {
//     id: 118,
//     name: 'fogg fantastic absolute fragrance body spray 120 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 119,
//     name: 'himalaya purifying neem face wash 50 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 120,
//     name:
//         'garnier men powerwhite anti pollution double action face wash 100 gm.jpg',
//     category: Category.pc
//   },
//   {
//     id: 121,
//     name: 'fiama multivariant gel bar 125 g pack of 4.jpg',
//     category: Category.pc
//   },
//   {
//     id: 122,
//     name: 'moov pain relief cream 50 g.jpg',
//     category: Category.pc
//   },
//   {
//     id: 123,
//     name: 'santoor sandal almond milk soap 115 g pack of 4.jpg',
//     category: Category.pc
//   },
//   {
//     id: 124,
//     name: 'gillette vector plus manual shaving razor twin blades.jpg',
//     category: Category.pc
//   },
//   id: 125, name: 'mouthwash.png', category: Category.pc},
//   {
//     id: 126,
//     name: 'nivea men cool kick deodorant 150 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 127,
//     name:
//         'stayfree dry max all night ultra thin sanitary napkin with wings xl 28 pads.jpg',
//     category: Category.pc
//   },
//   {
//     id: 128,
//     name: 'santoor orange soap 125 gm pack of 4.jpg',
//     category: Category.pc
//   },
//   {
//     id: 129,
//     name:
//         'colgate max fresh spicy fresh red gel anticavity toothpaste 150 g.jpeg',
//     category: Category.pc
//   },
//   id: 130, name: 'perfumes.png', category: Category.pc},
//   {
//     id: 131,
//     name: 'gillette mach3 shaving cartridge 3 blades 2 pcs.jpg',
//     category: Category.pc
//   },
//   {
//     id: 132,
//     name: 'parachute 100 pure coconut oil 500 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 133,
//     name: 'parachute 100 pure coconut oil 100 ml.jpeg',
//     category: Category.pc
//   },
//   {
//     id: 134,
//     name: 'gillette regular shaving cream 93 g.jpg',
//     category: Category.pc
//   },
//   {
//     id: 135,
//     name: 'clean clear oil free foaming face wash 150 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 136,
//     name: 'himalaya extra moisturizing baby soap 75 g.jpg',
//     category: Category.pc
//   },
//   {
//     id: 137,
//     name:
//         'colgate strong teeth dental cream toothpaste 200 g pack of 2 .jpeg',
//     category: Category.pc
//   },
//   {
//     id: 138,
//     name: 'godrej protekt masterblaster handwash refill 750 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 139,
//     name: 'nivea protect care deodorant 150 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 140,
//     name: 'parachute advansed aloe vera enriched coconut hair oil 250 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 141,
//     name: 'santoor orange soap 150 gm pack of 4.jpg',
//     category: Category.pc
//   },
//   {
//     id: 142,
//     name: 'johnson s baby shampoo 200 ml.jpg',
//     category: Category.pc
//   },
//   {
//     id: 143,
//     name: 'whisper ultra soft sanitary napkin with wings xl 15 pads.jpg',
//     category: Category.pc
//   },
//   {
//     id: 144,
//     name: 'himalaya baby diaper rash cream with almond oil 50 g.jpg',
//     category: Category.pc
//   },
//   {
//     id: 145,
//     name: 'mysore sandal soap 150 g pack of 3.jpg',
//     category: Category.pc
//   },
//   id: 146, name: 'panty liners.png', category: Category.pc},
//   {
//     id: 147,
//     name: 'medimix ayurvedic classic soap 125 gm pack of 3 .jpeg',
//     category: Category.pc
//   },
//   {
//     id: 148,
//     name: 'garnier men acno fight anti pimple face wash 50 gm.jpg',
//     category: Category.pc
//   },
//   id: 149, name: 'mysore sandal soap 125 gm.jpg', category: Category.pc},
//   id: 150, name: 'shampoo conditioner.png', category: Category.pc},
//   id: 151, name: 'cleanser make up remover.png', category: Category.pc},
//   {
//     id: 152,
//     name: 'santoor classic handwash refill 750 ml.jpeg',
//     category: Category.pc
//   },
//   {
//     id: 154,
//     name: 'durex extra ribbed condoms 10 pcs.jpg',
//     category: Category.misc
//   },
//   {
//     id: 155,
//     name: 'dettol original soap 125 gm x4 wrp.jpg',
//     category: Category.misc
//   },
//   {
//     id: 156,
//     name: 'safe life floral blossom handwash 750 ml pp.png',
//     category: Category.misc
//   },
//   {
//     id: 157,
//     name: 'dettol original soap 75 g pack of 4.jpg',
//     category: Category.misc
//   },
//   id: 158, name: 'dettol original soap 70 gm.jpg', category: Category.misc},
//   {
//     id: 159,
//     name: 'durex extra thin condoms 10 pcs.jpg',
//     category: Category.misc
//   },
//   {
//     id: 160,
//     name: 'safe life aqueous fresh handwash 750 ml.jpeg',
//     category: Category.misc
//   },
//   {
//     id: 161,
//     name: 'lifebuoy total 10 soap 125 g pack of 4.jpg',
//     category: Category.misc
//   },
//   {
//     id: 162,
//     name: 'ariel complete detergent powder 500 g.jpg',
//     category: Category.ke
//   },
//   {
//     id: 163,
//     name: 'everest coriander powder 100 g.jpeg',
//     category: Category.ke
//   },
//   {
//     id: 164,
//     name: 'madam nachni millet flour 500 g.jpg',
//     category: Category.ke
//   },
//   id: 165, name: 'rawa 500 g.jpg', category: Category.ke},
//   {
//     id: 166,
//     name: 'vanish oxi action stain remover liquid 400 ml.jpg',
//     category: Category.ke
//   },
//   {
//     id: 167,
//     name: 'daawat rozana super basmati rice 1 kg.jpg',
//     category: Category.ke
//   },
//   {
//     id: 168,
//     name: 'henko matic front load detergent powder 2 kg.jpg',
//     category: Category.ke
//   },
//   id: 169, name: 'detergents.jpg', category: Category.ke},
//   id: 170, name: 'detergent powder liquid.png', category: Category.ke},
//   id: 171, name: 'masti sihori wheat 10 kg.jpg', category: Category.ke},
//   id: 172, name: 'powdered spices.png', category: Category.ke},
//   id: 173, name: 'shree embly 200 gm.jpg', category: Category.ke},
//   id: 175, name: 'fortune rice bran oil 1 l.jpg', category: Category.ke},
//   {
//     id: 176,
//     name: 'good life kabuli chana 500 g.jpg',
//     category: Category.ke
//   },
//   {
//     id: 177,
//     name: 'everest tikhalal chilli powder 200 g.jpg',
//     category: Category.ke
//   },
//   id: 178, name: 'maida 500 g.jpg', category: Category.ke},
//   {
//     id: 179,
//     name: 'good life rajma red 500 gm pp.jpg',
//     category: Category.ke
//   },
//   {
//     id: 180,
//     name: 'ariel matic top load detergent powder 4 kg.jpg',
//     category: Category.ke
//   },
//   id: 181, name: 'red label leaf tea 1 kg.jpeg', category: Category.ke},
//   id: 182, name: 'surti kolam rice 10 kg.jpg', category: Category.ke},
//   {
//     id: 183,
//     name: 'daawat devaaya basmati rice 5 kg.jpg',
//     category: Category.ke
//   },
//   {
//     id: 184,
//     name: 'tata sampann high protein unpolished moong dal 500 g.jpg',
//     category: Category.ke
//   },
//   {
//     id: 185,
//     name: 'good life moong whole 500 g.jpg',
//     category: Category.ke
//   },
//   {
//     id: 186,
//     name: 'surf excel matic front load detergent powder 4 kg.jpg',
//     category: Category.ke
//   },
//   {
//     id: 187,
//     name: 'riso physically refined rice bran oil 5 l jar.jpg',
//     category: Category.ke
//   },
//   id: 188, name: 'tomato ketchup sauces.png', category: Category.ke},
//   id: 189, name: 'loose toor dal value 1 kg.jpg', category: Category.ke},
//   {
//     id: 190,
//     name: 'surf excel matic top load detergent powder 4 kg.jpg',
//     category: Category.ke
//   },
//   id: 191, name: 'leaf dust tea.png', category: Category.ke},
//   {
//     id: 192,
//     name: 'good life mp wheat chakki atta 5 kg.jpg',
//     category: Category.ke
//   },
//   {
//     id: 193,
//     name: 'tetley lemon honey green tea bags 30 pcs.jpg',
//     category: Category.ke
//   },
//   id: 194, name: 'fabric pre post wash.png', category: Category.ke},
//   {
//     id: 195,
//     name: 'fortune sun lite refined sunflower oil 5 l jar.jpg',
//     category: Category.ke
//   },
//   {
//     id: 196,
//     name: 'saffola gold ricebran based blended oil 1 l pouch.jpg',
//     category: Category.ke
//   },
//   {
//     id: 197,
//     name: 'daawat devaaya basmati rice 1 kg.jpg',
//     category: Category.ke
//   },
//   id: 198, name: 'good life s fennel 100 g.jpg', category: Category.ke},
//   {
//     id: 199,
//     name: 'ariel matic front load detergent powder 4 kg.jpg',
//     category: Category.ke
//   },
//   {
//     id: 200,
//     name: 'good life black pepper 50 g.jpg',
//     category: Category.ke
//   },
//   {
//     id: 201,
//     name: 'godrej ezee liquid detergent 500 gm.jpg',
//     category: Category.ke
//   },
//   id: 202, name: 'society tea 1 kg.jpeg', category: Category.ke},
//   {
//     id: 203,
//     name: 'mtr instant gulab jamun mix 175 g 50 off on 1 unit.jpg',
//     category: Category.ke
//   },
//   id: 204, name: 'good life sugar m 2 kg.jpg', category: Category.ke},
//   id: 205, name: 'sugar m 1 kg.jpg', category: Category.ke},
//   {
//     id: 206,
//     name: 'enzo matic front load detergent powder 6 kg.jpg',
//     category: Category.ke
//   },
//   {
//     id: 207,
//     name: 'sugar free natura sugar substitue 100 gm.jpg',
//     category: Category.ke
//   },
//   {
//     id: 208,
//     name: 'aashirvaad whole wheat atta 10 kg.jpeg',
//     category: Category.ke
//   },
//   id: 209, name: 'maida 1 kg.jpg', category: Category.ke},
//   {
//     id: 210,
//     name: 'good life turmeric powder 100 g.jpg',
//     category: Category.ke
//   },
//   {
//     id: 211,
//     name: 'enzo matic top load carton box 2kg.jpg',
//     category: Category.ke
//   },
//   id: 212, name: 'good life jeera 200 g.jpg', category: Category.ke},
//   {
//     id: 213,
//     name:
//         'enzo matic front load liquid detergent 500 ml buy 1 get 1 free .jpeg',
//     category: Category.ke
//   },
//   {
//     id: 214,
//     name: 'dabur chyawanprash with awaleha 1 kg.jpg',
//     category: Category.ke
//   },
//   id: 215, name: 'dessert mixes.png', category: Category.ke},
//   {
//     id: 216,
//     name: 'taj mahal tea 250 g carton .jpeg',
//     category: Category.ke
//   },
//   id: 217, name: 'tata gold tea 250 g.jpg', category: Category.ke},
//   {
//     id: 218,
//     name: 'pick n cook white urad gota 500 g.jpg',
//     category: Category.ke
//   },
//   {
//     id: 219,
//     name: 'daawat brown basmati rice 1 kg.jpeg',
//     category: Category.ke
//   },
//   {
//     id: 220,
//     name: 'enzo matic top load detergent powder 6 kg.jpg',
//     category: Category.ke
//   },
//   {
//     id: 221,
//     name: 'good life mp wheat chakki atta 10 kg.jpg',
//     category: Category.ke
//   },
//   {
//     id: 222,
//     name: 'sunrich refined sunflower oil 1 l pouch.jpg',
//     category: Category.ke
//   },
//   {
//     id: 223,
//     name: 'madhur pure hygienic sugar 5 kg.jpg',
//     category: Category.ke
//   },
//   {
//     id: 224,
//     name: 'suhana meat mutton masala 50 gm.jpg',
//     category: Category.ke
//   },
//   {
//     id: 225,
//     name: 'trust classic sulphurless sugar 1 kg.jpeg',
//     category: Category.ke
//   },
//   {
//     id: 226,
//     name: 'super sarvottam rice bran oil 1 l pouch.jpg',
//     category: Category.ke
//   },
//   id: 227, name: 'rawa sooji 1 kg.jpg', category: Category.ke},
//   id: 228, name: 'mtr rice idli mix 500 gm.jpg', category: Category.ke},
//   {
//     id: 229,
//     name: 'good life coriander powder 100 g.jpg',
//     category: Category.ke
//   },
//   id: 230, name: 'good life sugar m 5 kg.jpg', category: Category.ke},
//   id: 231, name: 'dishwash bars powders.png', category: Category.ke},
//   {
//     id: 232,
//     name: 'aarambh danedar assam tea 1 kg.jpg',
//     category: Category.ke
//   },
//   id: 233, name: 'loose chana dal 1 kg.jpg', category: Category.ke},
//   {
//     id: 234,
//     name: 'mtr instant rava idli mix 1 kg.jpg',
//     category: Category.ke
//   },
//   {
//     id: 235,
//     name: 'good life urad dal chilka 500 g.jpg',
//     category: Category.ke
//   },
//   {
//     id: 236,
//     name: 'daawat rozana gold basmati rice 5 kg.jpg',
//     category: Category.ke
//   },
//   {
//     id: 237,
//     name: 'aashirvaad pure iodised salt 1 kg.jpeg',
//     category: Category.ke
//   },
//   {
//     id: 238,
//     name: 'ariel matic front load detergent powder 1 kg.jpg',
//     category: Category.ke
//   },
//   id: 239, name: 'society tea 500 g.jpeg', category: Category.ke},
//   {
//     id: 240,
//     name: 'revive liquid stiffener 400 gm.jpg',
//     category: Category.ke
//   },
//   {
//     id: 241,
//     name: 'surf excel matic top load detergent powder 1 kg.jpg',
//     category: Category.ke
//   },
//   id: 242, name: 'atta.png', category: Category.ke},
//   id: 243, name: 'detergent bars.png', category: Category.ke},
//   {
//     id: 244,
//     name: 'madam roasted rawa sooji 500 g.jpg',
//     category: Category.ke
//   },
//   {
//     id: 245,
//     name: 'exo touch shine round dishwash bar 500 gm.jpg',
//     category: Category.ke
//   },
//   {
//     id: 246,
//     name: 'mtr 3 minute breakfast instant poha mix 60 g.jpeg',
//     category: Category.ke
//   },
//   {
//     id: 247,
//     name: 'best farms green cardamom 50 g.jpg',
//     category: Category.ke
//   },
//   {
//     id: 248,
//     name: 'henko matic front load detergent powder 1 kg.jpg',
//     category: Category.ke
//   },
//   {
//     id: 249,
//     name: 'pick n cook moong chilka 500 g.jpg',
//     category: Category.ke
//   },
//   {
//     id: 250,
//     name: 'aashirvaad superior mp whole wheat atta 5 kg.jpg',
//     category: Category.ke
//   },
//   id: 251, name: 'whole spices.png', category: Category.ke},
//   {
//     id: 252,
//     name: 'kissan fresh tomato ketchup 950 g.jpeg',
//     category: Category.ke
//   },
//   id: 253, name: 'besan 1 kg.jpg', category: Category.ke},
//   {
//     id: 254,
//     name: 'safewash matic top load refill 2 l pouch.jpg',
//     category: Category.ke
//   },
//   {
//     id: 255,
//     name: 'weikfield vanilla custard powder 100 g.jpg',
//     category: Category.ke
//   },
//   id: 256, name: 'tata iodised salt 1 kg.jpeg', category: Category.ke},
//   {
//     id: 257,
//     name: 'aashirvaad whole wheat atta 1 kg.jpeg',
//     category: Category.ke
//   },
//   {
//     id: 258,
//     name: 'patanjali lemon and wood ash super dishwash bar 175 g.jpg',
//     category: Category.ke
//   },
//   id: 259, name: 'loose hmt kolam rice 1 kg.png', category: Category.ke},
//   {
//     id: 260,
//     name: 'india gate classic basmati rice 1 kg.jpg',
//     category: Category.ke
//   },
//   id: 261, name: 'masti lokwan wheat 10 kg.jpg', category: Category.ke},
//   {
//     id: 262,
//     name: 'good life chilli powder 100 g.jpg',
//     category: Category.ke
//   },
//   {
//     id: 263,
//     name: 'tide plus jasmine rose detergent powder 500 g.jpg',
//     category: Category.ke
//   },
//   {
//     id: 264,
//     name: 'parth jaggery powder 500 g.jpg',
//     category: Category.ke
//   },
//   id: 265, name: 'breakfast snack mixes.png', category: Category.ke},
//   {
//     id: 266,
//     name:
//         'fortune rice bran health physically refined rice bran oil 5 l jar.jpg',
//     category: Category.ke
//   },
//   {
//     id: 267,
//     name: 'everest shahi biryani masala 50 g.jpeg',
//     category: Category.ke
//   },
//   id: 268, name: 'mtr rava dosa mix 500 gm.jpg', category: Category.ke},
//   id: 269, name: 'blended masalas.png', category: Category.ke},
//   {
//     id: 270,
//     name: 'best farms premium moth beans 500 g.jpg',
//     category: Category.ke
//   },
//   {
//     id: 271,
//     name: 'patanjali herbo wash detergent powder 1 kg.jpg',
//     category: Category.ke
//   },
//   id: 272, name: 'besan 500 g.jpg', category: Category.ke},
//   id: 273, name: 'loose moong dal 1 kg.jpg', category: Category.ke},
//   {
//     id: 274,
//     name: 'good life free flow iodised salt 1 kg.jpg',
//     category: Category.ke
//   },
//   {
//     id: 275,
//     name: 'everest turmeric powder 200 g.jpg',
//     category: Category.ke
//   },
//   {
//     id: 276,
//     name: 'enzo matic front load detergent powder 2 kg.jpeg',
//     category: Category.ke
//   },
//   id: 277, name: 'hmt kolam rice 10 kg.jpg', category: Category.ke},
//   {
//     id: 278,
//     name: 'tata sampann high protein moong whole 500 g.jpg',
//     category: Category.ke
//   },
//   {
//     id: 279,
//     name: 'good life big fennel 200 g.jpg',
//     category: Category.ke
//   },
//   {
//     id: 280,
//     name: 'milk wheat multigrain bread.png',
//     category: Category.dnb
//   },
//   {
//     id: 281,
//     name: 'britannia cheese slice plain 200 gm pp.png',
//     category: Category.dnb
//   },
//   {
//     id: 282,
//     name: 'muffets tuffets fruit bun 150 g.jpg',
//     category: Category.dnb
//   },
//   {
//     id: 283,
//     name: 'muffets tuffets pizza base 2ea 180 g.jpg',
//     category: Category.dnb
//   },
//   id: 284, name: 'butter margarine.png', category: Category.dnb},
//   {
//     id: 286,
//     name: 'amul cheese slice plain 200 gm pp.jpg',
//     category: Category.dnb
//   },
//   {
//     id: 287,
//     name: 'gowardhan plain cheese slices 476 g pouch.jpg',
//     category: Category.dnb
//   },
//   id: 288, name: 'ghee.png', category: Category.dnb},
//   {
//     id: 289,
//     name: 'britannia chesse slice plain 480 gm pp.png',
//     category: Category.dnb
//   },
//   {
//     id: 290,
//     name: 'muffets tuffets burger bun 150 g.jpg',
//     category: Category.dnb
//   },
//   {
//     id: 291,
//     name: 'nandini goodlife toned long life milk 1 l tetra pak.jpg',
//     category: Category.dnb
//   },
//   {
//     id: 292,
//     name: 'brita m m cheese cake 200gm pet.png',
//     category: Category.dnb
//   },
//   {
//     id: 293,
//     name: 'britannia cheese cubes 200 g carton.jpg',
//     category: Category.dnb
//   },
//   {
//     id: 294,
//     name: 'maida pizza base bread 250 gm.jpg',
//     category: Category.dnb
//   },
//   id: 295, name: 'milk.png', category: Category.dnb},
//   {
//     id: 296,
//     name: 'muffets tuffets ladipav 180 g.jpg',
//     category: Category.dnb
//   },
//   {
//     id: 297,
//     name: 'muffets tuffets multigrain bread 400 gm.jpg',
//     category: Category.dnb
//   },
//   id: 298, name: 'buttermilk and lassi.png', category: Category.dnb},
//   {
//     id: 299,
//     name: 'gowardhan fresh paneer 200 g.jpg',
//     category: Category.dnb
//   },
//   {
//     id: 300,
//     name: 'britannia cheese block 400 gm cbd.jpg',
//     category: Category.dnb
//   },
//   {
//     id: 301,
//     name: 'parle real elaichi premium rusk 200 g.jpeg',
//     category: Category.dnb
//   },
//   {
//     id: 302,
//     name: 'amul pasteurised butter 100 g.jpeg',
//     category: Category.dnb
//   },
//   id: 303, name: 'wibs bread 400 g.jpg', category: Category.dnb},
//   id: 304, name: 'paneer tofu.png', category: Category.dnb},
//   id: 305, name: 'britannia pav 200 gm.jpg', category: Category.dnb},
//   {
//     id: 306,
//     name: 'amul paneer fresh 200 gm pp.jpg',
//     category: Category.dnb
//   },
//   {
//     id: 307,
//     name: 'muffets and tuffets white bread 400 gm.jpg',
//     category: Category.dnb
//   },
//   id: 308, name: 'amul pure ghee 1 l pouch.jpg', category: Category.dnb},
//   id: 309, name: 'cheese.png', category: Category.dnb},
//   {
//     id: 310,
//     name: 'amul masti spiced buttermilk 1 l tetra pak .jpeg',
//     category: Category.dnb
//   },
//   {
//     id: 311,
//     name: 'gowardhan pure cow ghee 1 l pouch.jpg',
//     category: Category.dnb
//   },
//   {
//     id: 312,
//     name: 'muffets tuffets whole wheat bread 400 gm.jpg',
//     category: Category.dnb
//   },
//   {
//     id: 313,
//     name: 'burger bun with sesame seed 200 gm.jpg',
//     category: Category.dnb
//   },
//   {
//     id: 314,
//     name: 'amul pasteurised butter 500 g.jpeg',
//     category: Category.dnb
//   },
//   id: 315, name: 'flavoured milk.png', category: Category.dnb},
//   {
//     id: 316,
//     name: 'britannia 100 whole wheat bread 400 g.jpg',
//     category: Category.dnb
//   },
//   id: 317, name: 'milk powder cream.png', category: Category.dnb},
//   id: 318, name: 'freshly baked rusk 200gm.jpg', category: Category.dnb},
//   {
//     id: 319,
//     name: 'britannia cheezza 200 g carton.jpg',
//     category: Category.dnb
//   },
//   {
//     id: 320,
//     name:
//         'amul gold homogenised standardised long life milk 1 l tetra pak .jpeg',
//     category: Category.dnb
//   },
//   id: 321, name: 'wibs browny bread 400 gm.jpg', category: Category.dnb},
//   {
//     id: 322,
//     name: 'muffets tuffets brown bread 400 gm.jpg',
//     category: Category.dnb
//   },
//   {
//     id: 323,
//     name: 'nestle everyday dairy whitener 1kg pouch.jpg',
//     category: Category.dnb
//   },
//   {
//     id: 324,
//     name: 'amul taaza homogenised toned long life milk 1 l tetra pak .jpeg',
//     category: Category.dnb
//   },
//   {
//     id: 325,
//     name: 'amul masti dahi 1 kg pouch.jpg',
//     category: Category.dnb
//   },
//   {
//     id: 326,
//     name: 'dukes waffy chocolate flavoured wafers 75 g.jpeg',
//     category: Category.snd
//   },
//   {
//     id: 327,
//     name: 'parle krack jack biscuits 400 g.jpeg',
//     category: Category.snd
//   },
//   {
//     id: 328,
//     name: 'taj mahal tea 250 g carton.jpeg',
//     category: Category.snd
//   },
//   {
//     id: 329,
//     name: 'parle g original glucose biscuits 800 g.jpeg',
//     category: Category.snd
//   },
//   {
//     id: 331,
//     name: 'pediasure chocolate health drink powder 200 gm.jpg',
//     category: Category.snd
//   },
//   id: 332, name: 'red label leaf tea 1 kg.jpeg', category: Category.snd},
//   {
//     id: 333,
//     name: 'amul pro chocolate 500 g.jpeg',
//     category: Category.snd
//   },
//   {
//     id: 334,
//     name: 'good life w320 cashews 500 g.jpg',
//     category: Category.snd
//   },
//   {
//     id: 335,
//     name: 'parle monaco classic regular salted biscuits 400 g.jpeg',
//     category: Category.snd
//   },
//   id: 336, name: 'bournvita 750 g.jpg', category: Category.snd},
//   {
//     id: 337,
//     name: 'garden mumbai special diet bhel 150 gm.jpg',
//     category: Category.snd
//   },
//   {
//     id: 338,
//     name: 'tetley lemon honey green tea bags 30 pcs.jpg',
//     category: Category.snd
//   },
//   {
//     id: 339,
//     name: 'kaffe pure instant coffee 50 buy 1 get 1.jpg',
//     category: Category.snd
//   },
//   id: 340, name: 'coca cola 600 ml.jpg', category: Category.snd},
//   {
//     id: 341,
//     name: 'pediasure chocolate health drink powder 400 gm.jpg',
//     category: Category.snd
//   },
//   id: 342, name: 'sprite 600 ml.jpg', category: Category.snd},
//   id: 343, name: 'society tea 1 kg.jpeg', category: Category.snd},
//   {
//     id: 344,
//     name: 'kaffe blended instant coffee 50 g buy 1 get 1.jpg',
//     category: Category.snd
//   },
//   {
//     id: 345,
//     name: 'top ramen new masala instant noodles 420 g.jpeg',
//     category: Category.snd
//   },
//   id: 346, name: 'thums up 600 ml.jpg', category: Category.snd},
//   {
//     id: 347,
//     name: 'parle krack jack biscuits 200 g.jpeg',
//     category: Category.snd
//   },
//   id: 348, name: 'bournvita 500 g pouch.jpg', category: Category.snd},
//   {
//     id: 349,
//     name: 'cadbury bournvita health drink powder 1 kg.jpg',
//     category: Category.snd
//   },
//   id: 350, name: 'tata gold tea 250 g.jpg', category: Category.snd},
//   {
//     id: 351,
//     name: 'act ii golden sizzle instant popcorn 90 g.jpg',
//     category: Category.snd
//   },
//   {
//     id: 352,
//     name: 'saffola veggie twist instant masala oats 38 g.jpeg',
//     category: Category.snd
//   },
//   {
//     id: 353,
//     name: 'lay s india s magic masala potato chips 90 g.jpeg',
//     category: Category.snd
//   },
//   id: 354, name: 'good life almonds 500 g.jpg', category: Category.snd},
//   {
//     id: 355,
//     name: 'protinex vanilla delight 400 g.jpg',
//     category: Category.snd
//   },
//   {
//     id: 356,
//     name: 'parle g gold biscuits 1 kg.jpeg',
//     category: Category.snd
//   },
//   {
//     id: 357,
//     name: 'red bull energy drink 250 ml can.jpg',
//     category: Category.snd
//   },
//   {
//     id: 358,
//     name: 'complan royal chocolate health drink powder 500 gm.jpg',
//     category: Category.snd
//   },
//   id: 359, name: 'society tea 500 g.jpeg', category: Category.snd},
//   {
//     id: 360,
//     name: 'pedia sure vanilla health drink powder 200 gm.jpg',
//     category: Category.snd
//   },
//   {
//     id: 361,
//     name: 'maggi 2 minute masala instant noodles 70 g.jpeg',
//     category: Category.snd
//   },
//   {
//     id: 362,
//     name: 'saffola peppy tomato masala oats 39 gm.jpg',
//     category: Category.snd
//   },
//   {
//     id: 363,
//     name: 'parle g 110 gm pls20 gm extra pack.jpg',
//     category: Category.snd
//   },
//   {
//     id: 364,
//     name: 'parle g original glucose biscuits 250 g.jpeg',
//     category: Category.snd
//   },
//   {
//     id: 365,
//     name: 'parle hide seek chocolate chip cookies 100 gm.jpg',
//     category: Category.snd
//   },
//   {
//     id: 366,
//     name: 'sunfeast dark fantasy bourbon biscuits 150 g.jpeg',
//     category: Category.snd
//   },
//   {
//     id: 367,
//     name: 'parle monaco biscuits 75 4 g.jpg',
//     category: Category.snd
//   },
//   id: 368, name: 'tea.jpg', category: Category.snd},
//   id: 369, name: 'parle g biscuits 55 g.jpeg', category: Category.snd},
//   {
//     id: 370,
//     name: 'frooti mango drink 2 25 l.jpg',
//     category: Category.snd
//   },
//   {
//     id: 371,
//     name: 'britannia good day cashew cookies 600 g.jpeg',
//     category: Category.snd
//   },
//   {
//     id: 372,
//     name: 'bhikharam chandmal bikaneri bhujia 1 kg.jpeg',
//     category: Category.snd
//   },
//   {
//     id: 373,
//     name: 'kellogg s corn flakes 1 2 kg.jpg',
//     category: Category.snd
//   },
//   {
//     id: 374,
//     name: 'monster energy drink 350 ml can.jpg',
//     category: Category.snd
//   },
//   {
//     id: 375,
//     name: 'eveready red 1012 aaa carbon zinc batteries pack of 10.jpg',
//     category: Category.hhi
//   },
//   {
//     id: 376,
//     name:
//         'colin glass cleaner pump 2x more shine with shine boosters 500ml.jpg',
//     category: Category.hhi
//   },
//   {
//     id: 377,
//     name: 'multipurpose kitchen cloth 15 x 15 pack of 3.jpg',
//     category: Category.hhi
//   },
//   {
//     id: 378,
//     name: 'scrubz nylon scrubber 3 pcs.jpg',
//     category: Category.hhi
//   },
//   {
//     id: 379,
//     name: 'eveready red 1015 aa carbon zinc batteries pack of 10.jpg',
//     category: Category.hhi
//   },
//   {
//     id: 380,
//     name: 'patanjali gonyle floor cleaner 1 ltr.jpg',
//     category: Category.hhi
//   },
//   id: 382, name: 'dust cloth wipes.png', category: Category.hhi},
//   {
//     id: 383,
//     name: 'lizol power bathroom cleaner trigger 450 ml.jpg',
//     category: Category.hhi
//   },
//   {
//     id: 384,
//     name: 'puric paper napkin 100 pcs.jpg',
//     category: Category.hhi
//   },
//   {
//     id: 385,
//     name: 'scrubz stainless steel scrubber 50 off on 1 unit.jpg',
//     category: Category.hhi
//   },
//   {
//     id: 386,
//     name: 'lizol disinfectant surface floor cleaner liquid citrus 500 ml.jpg',
//     category: Category.hhi
//   },
//   id: 387, name: 'scrub pad.png', category: Category.hhi},
//   id: 388, name: 'paper tissues nakins.png', category: Category.hhi},
//   {
//     id: 389,
//     name: 'gala super scrub 10 cm x 10 cm.jpg',
//     category: Category.hhi
//   },
//   {
//     id: 390,
//     name: 'puric toilet paper roll 235 pulls pack of 4.jpg',
//     category: Category.hhi
//   },
//   id: 391, name: 'kitchen toilet rolls.png', category: Category.hhi},
//   {
//     id: 392,
//     name: 'white knight cocktail paper napkins 30 cm x 30 cm 100 pcs.jpg',
//     category: Category.hhi
//   },
//   {
//     id: 393,
//     name: 'lizol trigger power kitchen cleaner 450 ml.jpg',
//     category: Category.hhi
//   },
//   id: 394, name: 'toilet cleaners.png', category: Category.hhi},
//   id: 395, name: 'kitchen glass drain.png', category: Category.hhi},
//   id: 396, name: 'home one grass broom.jpg', category: Category.hhi},
//   id: 397, name: 'batteries.png', category: Category.hhi},
//   {
//     id: 398,
//     name: 'duracell ultra alkaline aa batteries pack of 4.jpg',
//     category: Category.hhi
//   },
//   {
//     id: 399,
//     name: 'puric facial tissues 100 pcs.jpg',
//     category: Category.hhi
//   },
//   {
//     id: 400,
//     name: 'mr muscle lemon kitchen cleaner spray 500 ml.jpg',
//     category: Category.hhi
//   },
//   id: 401, name: 'gala no dust broom xl.jpg', category: Category.hhi},
//   {
//     id: 402,
//     name: 'duracell ultra alkaline aaa batteries pack of 4.jpg',
//     category: Category.hhi
//   }
// ];
