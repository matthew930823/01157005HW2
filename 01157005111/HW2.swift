//
//  HW2.swift
//  01157005111
//
//  Created by user11 on 2024/10/16.
//

import SwiftUI
import Foundation
import AVKit
struct Info :Identifiable{
    let id = UUID()
    let name: String
    let image: ImageResource
    let region:Region
}
struct Region:Identifiable{
    let id = UUID()
    let image : ImageResource
    let story : String
    let partner:[String]
}
struct LegendaryInfo{
    let name: String
    let story: String
}
struct Sampledata{
    static let infos=[
        Info(name: "關都", image: .kanto,region:Region(image: .kantoMap,story: "關都地區（日文︰カントー地方，英文︰Kanto Region）是位於城都地區東邊、豐緣地區北邊、神奧地區南邊的一個巨大地區。這裡是《寶可夢》系列中出現的第一個地區，作為《紅／綠／藍／皮卡丘》、《火紅／葉綠》和《Let's Go！皮卡丘／Let's Go！伊布》的遊戲舞台，同時在《金／銀／水晶版》和《心金／魂銀》中也可以抵達。關都地區是唯一一個在五個世代的《寶可夢》系列中均出現過的地區。",partner: ["1","2","3"])),
        Info(name: "成都", image: .johto,region:Region(image: .johtoMap,story: "城都地區（日文︰ジョウト地方，英文︰Johto Region）是關都地區西邊的一個大地區。城都地區和關都地區位在同一塊大陸上，城都的聯盟位置也在石英高原。",partner: ["4","5","6"])),
        Info(name: "豐原", image: .hoenn,region:Region(image: .hoennMap,story: "豐緣地區（日文︰ホウエン地方，英文︰Hoenn Region）是城都地區西南邊的一個大地區，是《紅寶石／藍寶石／綠寶石》和《歐米加紅寶石／阿爾法藍寶石》中的舞台。豐緣地區以日本的九州島和其周遭島嶼為原型，地圖看上去與九州島逆時針旋轉90度之後的模樣很相似，其原因是為了要適配GBA橫向的機型。",partner: ["7","8","9"])),
        Info(name: "神奧", image: .sinnoh,region:Region(image: .sinnohMap,story: "神奧地區（日文︰シンオウ地方，英文︰Sinnoh Region）是寶可夢世界的一個地區，由本島、對戰特區所在的東北島嶼與東部的多數較小的島組成。神奧地區位於關都、城都和豐緣地區的東北方，是第四世代遊戲《鑽石／珍珠／白金》、第八世代遊戲《晶燦鑽石／明亮珍珠》的舞台。神奧地區的大部分道路位於本島上，與連接關都和城都的白銀山相同，天冠山位於神奧地區的中央，並向南北部延伸，將神奧地區分為東部和西部。",partner: ["10","11","12"])),
        Info(name: "洗翠", image: .hisui,region:Region(image: .hisuiMap,story: "洗翠地區（日文︰ヒスイ地方，英文︰Hisui）是寶可夢世界的一個地區，為神奧地區的古稱。",partner: ["13","14","15"])),
        Info(name: "合眾", image: .unova,region:Region(image: .unovaMap,story: "合眾地區（日文︰イッシュ地方，英文︰Unova Region）是寶可夢世界的一個地區，是《黑／白》、《黑２／白２》的舞台，位於合眾地區海上的藍莓學園則是《後篇：藍之圓盤》的舞台。合眾地區位置相較關都、城都、豐緣和神奧地區非常遙遠。與以前的《寶可夢》系列地區類似，合眾地區的原型也基於現實世界的地區。",partner: ["16","17","18"])),
        Info(name: "卡洛斯", image: .kalos,region:Region(image: .kalosMap,story: "卡洛斯地區（日文︰カロス地方，英文︰Kalos Region）是寶可夢世界的一個地區，也是《Ｘ／Ｙ》的舞台，以法國北半部為原型，幾乎所有法國北部的主要城市和觀光景點都被設計成遊戲的重要場所並且融入地圖中。",partner: ["19","20","21"])),
        Info(name: "阿羅拉", image: .alola,region:Region(image: .alolaMap,story: "阿羅拉地區（日文︰アローラ地方，英文︰Alola Region）是寶可夢世界的一個地區，也是《太陽／月亮》和《究極之日／究極之月》的舞台，以夏威夷為原型。",partner: ["22","23","24"])),
        Info(name: "伽勒爾", image: .galar,region:Region(image: .galarMap,story: "伽勒爾地區（日文︰ガラル地方，英文︰Galar Region）是寶可夢世界的一個地區，也是《劍／盾》的舞台，主體島嶼以英國大不列顛島的英格蘭和威爾士為原型。",partner: ["25","26","27"])),
        Info(name: "帕底亞", image: .paldea,region:Region(image: .paldeaMap,story: "帕底亞地區（日文︰パルデア地方，英文︰Paldea Region）是寶可夢世界的一個地區，也是《朱／紫》的舞台，以西班牙和葡萄牙所在的伊比利半島為原型。",partner: ["28","29","30"])),
    ]
}

let books = [
        "鎧島",
        "王冠雪原",
        "北上鄉",
        "藍莓學園"
]
let legendary = [
    LegendaryInfo(name: "急凍鳥", story: "急凍鳥是能自由操控冰的傳說的鳥寶可夢。據說它棲息在永久凍土的雪山，會飄曳著長尾巴飛過茫茫雪山。它能將冬日空氣中含有的水分凍結，在降下雪花、製造出暴風雪的同時在空中飛行。因為拍動翅膀就能冷卻空氣，所以據說急凍鳥飛過就會下雪。在雪山中冷得快要凍死時，它會出現在眼前。"),
    LegendaryInfo(name: "閃電鳥", story: "閃電鳥是能夠隨心所欲地操縱雷電的傳說的鳥寶可夢。據說它的巢穴處在漆黑的雷雲中，在雷雲分成兩片時能看到其身影。它在飛行的時候會發出爆裂的啪啪聲，扇動翅膀就會落下雷聲，拍動耀眼的翅膀就能產生強烈的雷電。據說只要它一摩擦翅膀，就會立刻從雲端落下巨大閃電。當天空黑暗，落雷不斷時，這隻傳說的寶可夢就會出現。如果被雷電擊中，它的體內就會湧現出力量。"),
    LegendaryInfo(name: "火焰鳥", story: "火焰鳥是操控火的傳說的鳥寶可夢，從很久以前就因火鳥傳說而聞名。據說身體受傷後，會進入火山口的熔岩裡，燃燒全身治癒傷口。它用橙色的如燃燒一般的翅膀凌駕看到的一切，振翅即刻火星閃耀。只要拍動翅膀，火焰鳥的羽毛都會明亮地燃燒起來，閃現出的紅色火焰有著令見過的人都心神激盪的美麗。當它揮舞起劇烈燃燒著的雙翅，哪怕是夜空也會被點亮。"),
    LegendaryInfo(name: "超夢", story: "超夢是通過重組了夢幻的遺傳基因製造出來的寶可夢，雖然超夢的基因幾乎和夢幻完全一樣，但是大小和性格卻迥異得讓人吃驚。它是某位科學家長年累月持續進行可怕的遺傳基因研究實驗所誕生的成果。超夢無與倫比的力量專為戰鬥而存在。它的戰鬥能力被提升至極限，因此變得除了打倒面前的敵人之外什麼都不想。"),
    LegendaryInfo(name: "雷公", story: "據說雷公是和雷電一同降臨的兇猛寶可夢。因為背著雨雲，所以它無論何時都能釋放雷電。它體內蘊藏著雷電般的速度，會一邊以雷擊的形式釋放體內激盪的力量，一邊在大地上四處奔跑。它發出如落雷般的長嚎會如同天雷落地時一樣震動空氣，搖撼大地。"),
    LegendaryInfo(name: "炎帝", story: "炎帝是體內蘊藏著熔岩般熱情的寶可夢，被認為是從火山的噴發中誕生的。它會吹出比火山的熔岩更熾熱的火焰，燃盡一切。它因為無法完全抑制漲滿的力量而在大地上來回奔跑，據說如果炎帝吼叫的話世界上的某處火山就會噴發。"),
    LegendaryInfo(name: "水君", story: "水君是體內蘊藏著泉水般溫柔的寶可夢，追尋著流淌著清澈水流的地方。它會用滑行一樣的動作在大地上四處奔跑，擁有瞬間淨化骯髒渾水的力量。據說其現身之時會莫名地吹起北風，會隨北風奔跑著離去，是北風的化身。"),
    LegendaryInfo(name: "蓋歐卡", story: "蓋歐卡據說是海洋的化身，具有操控水的力量，在神話中被稱作以瓢潑大雨和洶湧巨浪淹沒陸地來擴張海洋的寶可夢。它擁有生成足以掩蓋整個天空的龐大雨雲，並引發瓢潑大雨的力量，曾拯救過飽受干日照害的人們。傳說為了尋求自然的能量，它曾不斷與固拉多爭鬥，最後是烈空坐調解了它們之間的爭鬥。它在和固拉多殊死戰鬥之後就陷入了沉睡，一直沉睡在海溝的底部。"),
    LegendaryInfo(name: "固拉多", story: "固拉多據說是大地的化身，長久以來在神話中都被描述為創造土地，擴張大陸的寶可夢。它擁有使雨雲消失，用強光和高溫蒸發水分擴張大地的力量，曾作為救星出現在飽受洪水災害的人們面前。傳說為了尋求自然的能量，它曾不斷與蓋歐卡爭鬥，最後是烈空坐調解了它們之間的爭鬥。在與蓋歐卡殊死戰鬥後，便一直在地底的熔岩中沉睡著，據說一旦醒來火山就會噴發。"),
    LegendaryInfo(name: "烈空坐", story: "烈空坐在地球的臭氧層中生活了數億年，半夜時飛翔的姿態就像流星一樣，從未降落到地面過。因為棲息在高高的雲層之上的臭氧層，所以從地面無法看見它的樣子。世間流傳著其調解固拉多與蓋歐卡之間爭鬥的傳說，據說當蓋歐卡與固拉多互相戰鬥時，它就會降臨地面。它似乎以大氣層中的水和顆粒為食，吞食隕石作為食物，用儲存在體內的隕石能量來超級進化。")
]

struct HW2: View {
    @State private var indexxx:Int = 1
    @State private var rotateDegree: Double = 0
    @State private var currentIndex = 1
    @State private var scale: CGFloat = 1.0
    @State private var showView = false
    let player: AVPlayer = {
            if let url = Bundle.main.url(forResource: "test", withExtension: "mp4") {
                return AVPlayer(url: url)
            } else {
                fatalError("Video file not found in assets.")
            }
        }()
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                TabView {
                    Tab("地區", systemImage: "map.fill") {
                        List{
                            ForEach(Sampledata.infos) { info in
                                NavigationLink{
                                    RegionView(info:info)
                                }label:{
                                    InfoRow(info:info)
                                }
                            }
                        }
                        .listStyle(PlainListStyle())
                    }
                    Tab("更多", systemImage: "gamecontroller.fill") {
                        let columns = Array(repeating: GridItem(), count: 2)
                        ScrollView {
                            Text("DLC地區")
                                .font(.largeTitle)
                            LazyVGrid(columns: columns) {
                                ForEach(books.indices, id: \.self) { item in
                                    DLCView(book: books[item])
                                }
                            }
                            Link("神獸", destination: URL(string: "https://wiki.52poke.com/wiki/傳說的寶可夢")!)
                                .font(.largeTitle)
                            VStack{
                                ScrollView(.horizontal){
                                    HStack{
                                        ForEach(1..<11, id: \.self) { index in
                                            Image("Legendary\(index)")
                                                .resizable()
                                                .scaledToFill()
                                                .clipShape(.circle)
                                                .frame(width: geometry.size.width / 5)
                                                .overlay {
                                                    Circle()
                                                        .stroke(.white, lineWidth: 2)
                                                }
                                                .shadow(color: .primary, radius: 5)
                                                .onTapGesture {
                                                    indexxx=index
                                                }
                                        }
                                    }
                                }.scrollIndicators(.hidden)
                                TabView{
                                    ForEach(1..<4, id: \.self) { index in
                                        Image("Legendary\(indexxx)")
                                            .resizable()
                                            .scaledToFit()
                                            .scaleEffect(scale)
                                            .tag(1)
                                        Image("Legendary\(indexxx)\(indexxx)")
                                            .resizable()
                                            .scaledToFit()
                                            .scaleEffect(scale)
                                            .tag(2)
                                        
                                        VStack{
                                            ZStack{
                                                if currentIndex == 1 {
                                                    Image("Legendary\(indexxx)")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .scaleEffect(scale)
                                                } else if currentIndex == 2 {
                                                    Image("Legendary\(indexxx)\(indexxx)")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .scaleEffect(scale)
                                                } else if currentIndex == 3 {
                                                    ZStack {
                                                        Image("Legendary\(indexxx)")
                                                            .resizable()
                                                            .scaledToFit()
                                                        Image("Legendary\(indexxx)\(indexxx)")
                                                            .resizable()
                                                            .scaledToFit()
                                                            .blendMode(.colorBurn)
                                                        
                                                    }
                                                }
                                                if showView {
                                                    Text("合體")
                                                        .font(.largeTitle)
                                                        .padding()
                                                        .offset(y: -70)
                                                        .transition(.opacity)
                                                }
                                            }
                                            
                                            Button("轉換吧，\(legendary[indexxx-1].name)") {
                                                currentIndex = 1
                                                startAnimations()
                                                animateImages()
                                            }
                                        }
                                        .tag(3)
                                    }
                                }
                                .frame(height: geometry.size.width / 2)
                                .tabViewStyle(.page(indexDisplayMode: .never))
                                Text(legendary[indexxx-1].name)
                                    .font(.custom("CP-Font", size: 30))
                                Text(legendary[indexxx-1].story)
                                
                            }
                            .padding()
                            VStack {
                                VideoPlayer(player: player)
                                    .onAppear {
                                        player.play()
                                    }
                                    .onDisappear {
                                        player.pause()
                                    }
                                    .frame(height: 300)
                                
                                Spacer()
                            }
                            .padding()
                        }
                    }
                    Tab("匯率", systemImage: "creditcard.fill") {
                        ExchangeRate()
                    }
                }
                .tabViewStyle(.sidebarAdaptable)
                .navigationTitle("主頁")
            }
            
        }
    }
    private func startAnimations() {
            let steps = 6
            let animationDuration: TimeInterval = 0.3

            for step in 0..<steps {
                DispatchQueue.main.asyncAfter(deadline: .now() + (animationDuration * Double(step))) {
                    withAnimation {
                        showView.toggle()
                    }
                }
            }
        }
    private func animateImages() {
        let animationDuration: TimeInterval = 0.3
        let totalSteps = 9 // 設置步骤
        
        for step in 0..<totalSteps {
            DispatchQueue.main.asyncAfter(deadline: .now() + (animationDuration * Double(step))) {
                withAnimation(.easeInOut(duration: animationDuration)) {
                    if step == totalSteps - 1 {
                        scale = 1.0
                        currentIndex = 3
                    }
                    else if step % 2 == 0 {
                        scale = 1.5
                    } else {
                        scale = 1.0
                        currentIndex = (currentIndex % 2) + 1
                    }
                }
            }
        }
        
    }
}

struct InfoRow: View {
    let info:Info
    var body: some View {
        
        HStack {
            Image(info.image)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(.circle)
                .overlay {
                    Circle()
                        .stroke(.white, lineWidth: 2)
                }
                .shadow(color: .primary, radius: 5)
            Text(info.name)
                .fontWeight(.bold)
                .font(.custom("CP-Font", size: 50))
            Spacer()
        }
    }
}
struct RegionView: View {
    let info:Info
    var body: some View {
        ScrollView{
            VStack {
                Image(info.region.image)
                    .resizable()
                    .scaledToFit()
                VStack{
                    Text(info.name)
                        .fontWeight(.bold).foregroundStyle(.black)
                        .font(.custom("CP-Font", size: 50))
                    Text(info.region.story).foregroundStyle(.black)
                        .font(.custom("CP-Font", size: 20))
                }
                .padding()
                .background(.lightgray)
                Text("初始的夥伴")
                    .font(.custom("CP-Font", size: 30))
                    .padding()
                HStack{
                    ForEach(0..<info.region.partner.count, id: \.self) { index in
                        Image(info.region.partner[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width:70, height: 70)
                            .clipShape(.circle)
                            .overlay {
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                            }
                            .shadow(color: .primary, radius: 5)
                    }
                }
            }
        }
        
    }
}
struct DLCView: View {
    let book: String
    
    var body: some View {
        VStack {
            Rectangle()
                .aspectRatio(1, contentMode: .fit)
                .overlay {
                    Image(book)
                        .resizable()
                        .scaledToFill()
                }
                .clipped()
            Text(book)
        }
    }
}
#Preview {
    HW2()
}
