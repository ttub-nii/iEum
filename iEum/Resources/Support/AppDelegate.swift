//
//  AppDelegate.swift
//  iEum
//
//  Created by 황수빈 on 15/07/2019.
//  Copyright © 2019 황수빈. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var scrap = 0
    var like = 0
    var my = 0
    
    // MainViewController
    var workList: [Work] = [Work(workIdx: 1, title: "Frami", subTitle: "전문적으로 사람들을 돕는다", workName: "mainImg01", subName: "subFrami"), Work(workIdx: 2, title: "City of the Sun", subTitle: "태양의 도시", workName: "mainImg02", subName: "subCity"), Work(workIdx: 3, title: "Abastecedora", subTitle: "완전히 시각적인 브랜딩", workName: "mainImg03", subName: "subAbastecedora"), Work(workIdx: 4, title: "Boston", subTitle: "최단거리 어플", workName: "mainImg04", subName: "subBoston"), Work(workIdx: 5, title: "Chromatic Pastels", subTitle: "나의 탐험을 비추는 빛", workName: "mainImg05", subName: "subChromatic"), Work(workIdx: 6, title: "WUEN trailer", subTitle: "wuen의 여행이야기", workName: "mainImg06", subName: "subWuen"), Work(workIdx: 7, title: "디어데이", subTitle: "당신의 좋은 날을 위해", workName: "mainImg07", subName: "subDearday"), Work(workIdx: 8, title: "Apple and Orange", subTitle: "홍보", workName: "mainImg08", subName: "subApple"), Work(workIdx: 9, title: "JB Nature", subTitle: "자연 모델링", workName: "mainImg09", subName: "subJb"), Work(workIdx: 10, title: "The Modern Paradise", subTitle: "Los Angeles, CA", workName: "mainImg10", subName: "subModern"), Work(workIdx: 11, title: "TIP Milano", subTitle: "팁 문화", workName: "mainImg11", subName: "subTip"), Work(workIdx: 12, title: "Robot, Monster, Mammal", subTitle: "캐릭터 디자인", workName: "mainImg12", subName: "subRobot"), Work(workIdx: 13, title: "Refinery 29", subTitle: "월급 이야기", workName: "mainImg13", subName: "subRefine"), Work(workIdx: 14, title: "MAMIE", subTitle: "사용자 지정 유형 타이틀", workName: "mainImg14", subName: "subMamie"), Work(workIdx: 15, title: "36 Days Of Type 2019", subTitle: "36가지 모습의 알파벳", workName: "mainImg15", subName: "sub36Days"), Work(workIdx: 16, title: "Beyond Imagination", subTitle: "상상 예술", workName: "mainImg16", subName: "subBeyond"), Work(workIdx: 17, title: "Collection Illustration", subTitle: "일러스트 디자인", workName: "mainImg17", subName: "subCollection"), Work(workIdx: 18, title: "Rocklets Vs", subTitle: "3D Graphics", workName: "mainImg18", subName: "subRocklets"), Work(workIdx: 19, title: "École Camondo", subTitle: "카드 디자인", workName: "mainImg19", subName: "subEcole"), Work(workIdx: 20, title: "풀리피 이야기", subTitle: "그래픽 아트", workName: "mainImg20", subName: "subPulleafy")]
    
    var bannerList: [Banner] = []
    
    // SubViewController
    var detailList: [Detail] = [Detail(workIdx: 0, explanation: "프라미(Frami)는 전문적으로 사람들을 돕는다는 비전을 가진 온라인 교육 과정을 제공하는 디지털 플랫폼입니다. 아이슬란드어로만 콘텐츠를 제공하는 최초의 플랫폼입니다.\n 기하학적 구성을 디자인한 학습 방법에 영감을, 세리프 타이포그래피와 균형을 이뤄 전문적인 미적 감각을 갖습니다.\n 프래미, 모든 사람에게 쉽게 다가갈 수 있는 지식.", workName: "subSubFrami"), Detail(workIdx: 1, explanation: "프라미(Frami)는 전문적으로 사람들을 돕는다는 비전을 가진 온라인 교육 과정을 제공하는 디지털 플랫폼입니다. 아이슬란드어로만 콘텐츠를 제공하는 최초의 플랫폼입니다.\n 기하학적 구성을 디자인한 학습 방법에 영감을, 세리프 타이포그래피와 균형을 이뤄 전문적인 미적 감각을 갖습니다.\n 프래미, 모든 사람에게 쉽게 다가갈 수 있는 지식.", workName: "subSubFrami"), Detail(workIdx: 2, explanation: "«태양의 도시»는 성격의 충분한 발전을 위한 가족 교육 센터입니다. 3년 동안 “태양의 도시”의 핵심 개념은 연구 과정을 인본주의 교육의 원칙에 기반을 둔 학교입니다. 거기서 공부하는 아이들뿐만 아니라 부모님과 선생님들도 공부합니다.\n Fabula Branding 팀 임무는 브랜드 플랫폼을 개발하여 센터의 밝은 정체성을 창출하고 언어 및 시각적 의사 소통을 통해 학교 공간의 본질을 형성하는 것이 었습니다.", workName: "subSubCity"), Detail(workIdx: 3, explanation: "힐스 국립구세자(Hilos)는 우리 문서 강좌를 위해 설계된 프로젝트입니다.\n\n 저희는 다른 앱을 디자인할 수 있도록 하는 브랜드를 선택합니다.완전히 시각적이었습니다. 이 자료를 통해 개념화, 이후에 생산과 같은 기본적인 측면에서 모든 프로세스 단계들을 노출시켜 브랜딩 프로젝트를 어떻게 기록하는지 보여 준다.", workName: "subSubAbastecedora"), Detail(workIdx: 4, explanation: "전기 자동차로 프리미엄 승객을 최단 거리로 안내해 주는 어플.\n\n핸드폰, 데스크탑, 테블릿 등 각자의 장점을 살려 독특한 특징을 살렸습니다.\n\n 계정 생성을 생성하고 난 뒤 최단 거리 네비게이션을 이용할 수 있습니다.", workName: "subSubBoston"), Detail(workIdx: 5, explanation: "나의 탐험을 비추는 빛에 따라\n\n 이 시리즈는 미묘한 파스텔 환경에 대비하여 역동적인 색채 팔레트를 볼 수 있습니다.\n 18” x 24” 인쇄물은 저의 쇼핑 페이지에서 구할 수 있습니다.\n https://shanegriffin.myshopify.com/", workName: "subSubChromatic"), Detail(workIdx: 6, explanation: "시골 소년과 그의 말이 풀밭에 사는 우정 이야기입니다.\n 그의 말인 우엔과 모리는 매일 잔디밭 언덕을 타며 즐거운 시간을 보내지만, 뜻밖의 재난으로 두 사람이 헤어지면 좋은 날은 슬프게 끝납니다.\n\n 현재 국제 영화제에서 단편 영화가 상영되고 있기 때문에 아래의 트레일러를 볼 수 있습니다.\n (2019 3월 제작 완료)", workName: "subSubWuen"), Detail(workIdx: 7, explanation: "월경전 변화에 의한 불편한 상태 개선과 면역과민반응에 의한 피부 개선에 도움을 줄 수 있는 건강기능식품입니다.\n\n 당신의 좋은 날을 위해. 디어데이.\n \n 밝은 컬러를 사용해 거부감을 낮추고 긍정적인 이미지를 주려고 하였습니다.", workName: "subSubDearday"), Detail(workIdx: 8, explanation: "안녕하세요!\n ‘애플과 오렌지.’ 뉴욕의 타임 스퀘어 (time square)에 게시판에 게시된 물체 및 캐릭터 포스터를 디자인했습니다. 회사 이름과 슬로건에서 영감을 얻었습니다. \n ‘Fresh Ideas Fruitful results’ \n 또한 과일과 밝은 분위기를 주기 위해 많은 색상을 사용했습니다.", workName: "subSubApple"), Detail(workIdx: 9, explanation: "JB 네이처\n 이 개인 프로젝트는 로고를 가지고 놀며 자연 요소, 질감 및 조명을 탐구하는 일련의 정지 이미지로 구성됩니다.\n마음에 들어 했으면 좋겠네요.", workName: "subSubJb"), Detail(workIdx: 10, explanation: "이것은 ‘현대 낙원’의 두 번째 시리즈입니다.\n 이 시리즈는 색채 언어를 통해 현실과 환상 사이의 미세한 선을 탐구하는데, 이는 또한 시청자들이 그러한 공간을 여행할 수 있도록 힘을 주고, 초현실적인 색채를 현실로 드레싱하는 데 초점을 맞추며, 시청자의 상상력의 경계에도 더 도전합니다.", workName: "subSubModern"), Detail(workIdx: 11, explanation: "저는 미국에서 6년 정도 살고 있습니다. 대부분의 사람들은 제가 여기 그렇게 오래 살고 있기 때문에 미국 문화에 대해 모든 것을 알고 있다고 생각할지도 모릅니다.\n\n 하지만, 나는 여전히 많은 것에 의문을 품고 있으며, 팁을 주는 예절도 그 중 하나입니다. 한국은 팁 문화가 전혀 없습니다", workName: "subSubTip"), Detail(workIdx: 12, explanation: "시네마4D, 옥탄, 지브러쉬\n\n 내 집에는 굵은 색과 반복을 사용하는 정형화된 스타일의 캐릭터 애니메이션이 있습니다. 나쁜 뱀이 마을을 지나갈 때, 사람들을 무장해제시키는 것을 지켜봅니다. 우리는 감히 그것이 현재의 정치 지형에 대한 직접적인 반응이 아니라 최근의 사건들에 의해 다소 영향을 받은 주제적인 조각이라고 말합니다", workName: "subSubRobot"), Detail(workIdx: 13, explanation: "맨해튼 첼시의 25번가와 6번가 모퉁이에 위치한 콜로살 미디어의 팀이 손으로 그린 한 가지 종류의 벽화를 위해 시트릭스와 파트너를 맺은 것은 멋진 경험이었습니다.\n\n Citrix는 직원들에게 모든 것을 가능하게 하고 통제하는 데 필요한 가시성, 단순성 및 보안으로 IT를 무장하면서 하나의 통일된 경험에서 생산적으로 필요한 모든 것을 제공하는 디지털 작업 공간 플랫폼입니다.", workName: "subSubRefine"), Detail(workIdx: 14, explanation: "파리에 있는 진 임버트의 새로운 레스토랑의 정체성, 예술 방향, 맞춤형 글꼴, 삽화 및 그래픽 디자인\n\n카테일 메뉴\n 삽화와 캔슨 연필을 제작했습니다.", workName: "subSubMamie"), Detail(workIdx: 15, explanation: "’36 Days Of Type ‘은 타이포그래피 프로젝트의 이름으로, \n 모든 사람이 하루에 다른 편지 (그리고 숫자)를 사용했습니다. \n 우리는 다양한 질감의 재질을 사용하여 알파벳을 디자인했습니다. 그리고 우리는 각 알파벳의 문자로 디자인했습니다.\n \n 여기 내 일부가 있습니다. 여러분이 이 작품을 마음껏 즐기시길 바랍니다!", workName: "subSub36Days"), Detail(workIdx: 16, explanation: "Beyond Imagination은 하나의 한정된 공간 내에 존재하는 다중 현실에 대한 아이디어를 탐구하는 개인 프로젝트입니다.\n 이 방은 우리의 상상력에 열쇠 구멍 역할을하며, 마음으로 아무것도 만들지 못하는 거의 모든 것을 만들 수 있습니다.\n\n 이 프로젝트의 목적은 우리의 마음을 헤쳐나가게 할 시간을 가지면 공간이 어떻게 우리의 상상력을위한 캔버스인지를 보여주는 것입니다.", workName: "subSubBeyond"), Detail(workIdx: 17, explanation: "브랜드 안에 무엇이 있습니까? 그것은 괴물일 수도 있고 수퍼 히어로일 수도 있습니다. 그것은 훌륭한 특수 효과이거나 세계를 구하기 위한 이야기 ​일 수 있습니다.\n\n 나는 그것이 상상력이 풍부해야 하고 무제한적이어야 한다고 생각한다.\n 그래서 이 개념을 다른 표현으로 해석할 수 있는지 궁금합니다.", workName: "subSubCollection"), Detail(workIdx: 18, explanation: "3D Development & Animation: BANDIDOGUAPO\n\nDirected by: 이지은\n Produced by: 김아영\n\nCreative Direction: 오은지\nArt Direction: 박지영\nAnimation Direction: 이지우\n", workName: "subSubCollection"), Detail(workIdx: 19, explanation: "Ecole Camondo는 뉴질랜드 오클랜드와 도심에 사무실을두고 재산법 전문 뉴질랜드 법률 회사입니다. 우리는 작가이자 전략가인 Matt Zwartz와 함께 Neilsons의 기존 정체성을 발전 시켰습니다. 이전 로고는 네이비와 로얄 레드로 설정된 검은 글자 ’N’으로 구성되었습니다. ’E’은보다 현대적인 검은 글씨체로 바뀌 었습니다. 수정된 ID는 완전한 브랜드 자산 세트와 새로운 웹 사이트를 통해 업데이트되었습니다", workName: "subSubEcole"), Detail(workIdx: 20, explanation: "Client: Thingsflow\n Production Company: GRABIT\n\n Director: 이은솔\n Lead Artist: 윤성아\n2D Designer: 김성우\n Rigger: 양진영\n Sound: 이준화", workName: "subSubPulleafy")]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "iEum")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

