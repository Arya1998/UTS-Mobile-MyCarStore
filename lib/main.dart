import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'navbar.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> images = [
    'https://www.worldofghibli.id/wp-content/uploads/2019/08/gambar-mobil-toyota.webp',//0
    'https://www.worldofghibli.id/wp-content/uploads/2019/08/gambar-mobil-wuling.webp',//1
    'https://www.worldofghibli.id/wp-content/uploads/2019/08/gambar-mobil-xpander.webp',//2
    'https://www.worldofghibli.id/wp-content/uploads/2019/08/gambar-mobil-alphard.webp',//3
    'https://www.worldofghibli.id/wp-content/uploads/2019/08/gambar-mobil-avanza.webp',//4
    'https://www.worldofghibli.id/wp-content/uploads/2019/08/gambar-mobil-ayla.webp',//5
    'https://www.worldofghibli.id/wp-content/uploads/2019/08/gambar-mobil-bmw.webp',//6
    'https://www.worldofghibli.id/wp-content/uploads/2019/08/gambar-mobil-ferrari.webp',//7
    'https://www.worldofghibli.id/wp-content/uploads/2019/08/gambar-mobil-jeep.webp',//8
    'https://www.worldofghibli.id/wp-content/uploads/2019/08/gambar-mobil-lamborghini-aventador.webp',//9
  ];
  final List<String> nama =[
    'Toyota Yaris TRD Sportivo A/T 2021',
    'Wuling Almaz Exclusive 7 Seater A/T 2021',
    'X-Pander Sport M/T 2019',
    'Toyota Alphard 2.5 G A/T 2021',
    'Toyota Avanza Type G 2.0 M/T 2015',
    'Daihatsu Ayla M/T 2014',
    'BMW M6 Convertible M/T 2013',
    'Ferari 488 Spider 2019',
    'Jeep Wrangler Sport 2 Door M/T 2020',
    'Lamborghini Aventador S Roadster 2020',
  ];
  final List<String> harga =[
    'Rp. 572.000.000',
    'Rp. 361.000.000',
    'Rp. 352.000.000',
    'Rp. 1.398.000.000',
    'Rp. 231.000.000',
    'Rp. 94.000.000',
    'Rp. 654.000.000',
    'Rp. 5.456.000.000',
    'Rp. 1.345.000.000',
    'Rp. 7.233.000.000',
  ];
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home :Scaffold(
        key: _key,
      drawer: NavBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              expandedHeight: 150.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('MyCar Store'),
                background: PNetworkImage(images[1], fit: BoxFit.cover),
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  tooltip: 'Shooping_cart',
                  onPressed: () {},
                ),
              ]),
          SliverToBoxAdapter(
            child: Container(
                color: Colors.deepOrange,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialButton(
                          onPressed: () {},
                          child: Text("Mobil Yang Tersedia".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                      MaterialButton(
                          onPressed: () {},
                          child: Text("Lihat Semua".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400))),
                    ],
                  ),
                )),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                  crossAxisCount: 2),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return _buildItems(index, context);
                },
                childCount: images.length,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
                margin: EdgeInsets.only(top: 20.0),
                color: Colors.pink,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MaterialButton(
                          onPressed: () {},
                          child: Text("Mobil Lagi Trend".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                      MaterialButton(
                          onPressed: () {},
                          child: Text("Lihat Semua".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400))),
                    ],
                  ),
                )),
          ),
          SliverToBoxAdapter(
            child: _buildSlider(),
          ),
          SliverToBoxAdapter(
            child: Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.pink,
                child: Text("Mobil Rekomendasi Untuk Anda".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return _buildListItem(index);
              },
              childCount: images.length,
            ),
          )
        ],
      ),
    ),
    );
  }

  Widget _buildSlider() {
    return Container(
      padding: EdgeInsets.only(bottom: 20.0),
      height: 200.0,
      child: Container(
        child: Swiper(
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return new PNetworkImage(
              images[index],
              fit: BoxFit.cover,
            );
          },
          itemCount: 4,
          pagination: new SwiperPagination(),
        ),
      ),
    );
  }

  Widget _buildItems(int index, BuildContext context) {
    return Container(
      height: 200,
      child: GestureDetector(
        onTap: () => _onTapItem(context, index),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Hero(
                    tag: "item$index",
                    child: PNetworkImage(images[index % images.length],
                        fit: BoxFit.cover))),
            SizedBox(
              height: 10.0,
            ),
            Text(
              nama[index],
              softWrap: true,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(harga[index],
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(int index) {
    return Container(
        height: 100,
        child: Card(
          child: Center(
            child: ListTile(
              leading: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(images[index % images.length]),
              ),
              title: Text(nama[index],
                softWrap: true,
              ),
              subtitle: Text(harga[index],
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
          ),
        ));
  }

  _onTapItem(BuildContext pcontext, int index) {
    Navigator.of(pcontext)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Mobil Yang Ingin Anda Lihat'),
        ),
        body: Material(
          child: Container(
            // The blue background emphasizes that it's a new route.
            color: Colors.white,
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Hero(
                          tag: "item$index",
                          child: PNetworkImage(images[index % images.length],
                              fit: BoxFit.cover))),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Mobil ini telah lulus uji kelayakan untuk dikendarai',
                    softWrap: true,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Untuk warna mobil sesuai dengan gambar',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }
}

class PNetworkImage extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double width,height;
  const PNetworkImage(this.image, {Key key,this.fit,this.height,this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      // errorWidget: (context, url, error) => Image.asset('assets/placeholder.jpg',fit: BoxFit.cover,),
      fit: fit,
      width: width,
      height: height,
    );
  }
}

const List<String> images = [

];
