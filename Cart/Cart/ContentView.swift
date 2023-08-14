//
//  ContentView.swift
//  Cart
//
//  Created by Jongwook Park on 2023/08/07.
//

// TO DOs
// 1. ProductStore
// 1) JSON 요청 보내기 (완)
// 2) reponse의 statuscode에 따른 예외 처리하기
//      - case 1) 정해진 웹주소의 파일을 읽을 수 없는 경우
//      - case 2) 파일을 읽었지만 데이터 변환에 실패한 경우
//  - 열거형 만들고
//  - 그 열거형을 리턴한다.
//  - 리턴값 받는 쪽에서 switch로 분기하여 팝업창 적당히 띄우기.

// 2. CartStore
// 1) 처음에 실행할 때 (onAppear), UserDefaults를 사용하여 데이터 가져오기
// 2) 카트에 저장될 때, 업데이트된 값을 UserDefaults를 사용하여 저장하기

import SafariServices
import SwiftUI

enum FetchStatus {
    case yet                // 초기 상태 (아직 통신 X)
    case success            // 성공
    case invalidUrl         // URL 오류
    case failedToComm       // 통신 오류
    case failedToParse      // 응답값 파싱 오류
}

extension Double {
    var currencyString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "KRW"
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}

struct Product: Identifiable, Codable {
    var id: String
    var name: String
    var price: Double
    var imageURLString: String
    var shopURLString: String
    
    var priceString: String {
        price.currencyString
    }
    
    var imageURL: URL {
        URL(string: imageURLString) ?? URL(string: "https://apple.com")!
    }
    
    var shopURL: URL {
        URL(string: shopURLString) ?? URL(string: "https://apple.com")!
    }
}

class ProductStore: ObservableObject {
    @Published var products: [Product] = []
    
    func fetchProducts() async -> FetchStatus {
//        let urlString = "https://run.mocky.io/v3/c3cf8d7c-ef6a-4876-8bb1-5f82f53d6805"    // original
        let urlString = "https://run.mocky.io/v3/c3cf8d7c-ef6a-4876-8bb1-5f82f53d680" // 유효하지 않은 데이터 error
//        let urlString = "run.mocky.io/v3/c3cf8d7c-ef6a-4876-8bb1-5f82f53d680" // 유효하지 않은 URL
        
        guard let url = URL(string: urlString) else {
            debugPrint("invalid url")
            return .invalidUrl
        }
        
        do {
            // 궁금한 점?
            // URLSession.shared.dataTask(from: url) 대신 URLSession.shared.data(from: url)를 사용할 때,
            // 호출된 함수의 반환값은 전자에서의 후행 클로저에서 썼던 3개의 파라미터와 동일하게, 3개일까?
            // data, response, error
            // 한번 써보자
            
            // 결론은 URLSession.shared.dataTask(from: url) 는 고전적인 방법이고,
            // async/await 방식으로 비동기 작업을 처리하는 방식이 URLSession.shared.data(from: url)이므로
            // 이걸 쓰는 것이 맞다.
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // 응답의 status code는 HTTPURLResponse 내부에 정의되어 있는데
            // URLSession.shared.data(from: url)의 반환값 중 response는 URLResponse 객체다.
            // 따라서, 반환값 response에 바로 status code로 접근하는 것은 불가능하다.
            // 그러므로, URLResponse 타입의 response를 HTTPURLResponse로 변환한 후 접근해야 한다.
            let httpResponse = response as? HTTPURLResponse
            if httpResponse?.statusCode != 200 {
                return .failedToComm
            }

            // 응답으로 가져온 데이터를 Published 배열에 저장
            products = try JSONDecoder().decode([Product].self, from: data)
            return .success
        } catch _ as URLError {
            return .invalidUrl
        } catch {
            debugPrint("invalid parsing")
            return .failedToParse
        }
    }
}

class CartStore: ObservableObject {
    @Published var products: [Product] = []
    
    func addProduct(_ product: Product) {
        products.append(product)
    }
    
    func removeProducts(at offsets: IndexSet) {
        products.remove(atOffsets: offsets)
    }
}

struct SafariView: UIViewControllerRepresentable {
    @Binding var url: URL
    
    func makeUIViewController(context: Context) -> some UIViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // ...
    }
}

struct AddingProductView: View {
    var cartStore: CartStore
    @Binding var isShowingAdding: Bool
    
    @State var fetchStatus: FetchStatus = .yet  // for making alert of fetching data to network
    @State var isShowingAlert: Bool = false
    
    @ObservedObject private var productStore: ProductStore = .init()
    
    var body: some View {
        NavigationStack {
            List(productStore.products) { product in
                VStack(alignment: .leading) {
                    AsyncImage(url: product.imageURL) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(product.name)")
                                .font(.headline)
                            Text("\(product.priceString)")
                        }
                        Spacer()
                        Button("Add") {
                            cartStore.addProduct(product)
                            isShowingAdding.toggle()
                        }
                        .buttonStyle(.bordered)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Add your product")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isShowingAdding.toggle()
                    }
                }
            }
        }
        .refreshable {
            // 밖에서는 Task 블록 안에 비동기함수 await
            Task {
                await fetchProducts()
            }
        }
        .onAppear {
            Task {
                await fetchProducts()
            }
        }
        .alert("Network Error", isPresented: $isShowingAlert) {
            Button("재시도") {
                isShowingAlert.toggle()
                Task {
                    await fetchProducts()
                }
            }
            
            Button("취소") {
                isShowingAlert.toggle()
                isShowingAdding.toggle()
            }
        } message: {
            switch fetchStatus {
            case .invalidUrl:
                Text("유효하지 않는 URL입니다.")
            case .failedToComm:
                Text("네트워크 통신에 실패했습니다.")
            case .failedToParse:
                Text("데이터 처리에 실패했습니다.")
            default:
                Text("")
            }
        }
    }
    
    func fetchProducts() async {
        fetchStatus = await productStore.fetchProducts()
        if fetchStatus != .success {
            isShowingAlert.toggle()
        }
        debugPrint(fetchStatus)
    }
}

struct ContentView: View {
    @ObservedObject var cartStore: CartStore = .init()
    
    @State private var isShowingAdding: Bool = false
    @State private var isShowingShop: Bool = false
    @State private var shopURL: URL = .init(string: "https://apple.com")!
    
    // 테스트
    @State private var requestUrlString: String = "https://run.mocky.io/v3/c3cf8d7c-ef6a-4876-8bb1-5f82f53d6805"
    private let requestUrlStrings: [String] = [
        "https://run.mocky.io/v3/c3cf8d7c-ef6a-4876-8bb1-5f82f53d6805",
        "run.mocky.io/v3/c3cf8d7c-ef6a-4876-8bb1-5f82f53d680",
        "run.mocky.io/v3/c3cf8d7c-ef6a-4876-8bb1-5f82f53d680"
    ]
    
    private var isCartEmpty: Bool {
        return cartStore.products.isEmpty
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if isCartEmpty {
                    VStack(alignment: .center) {
                        Image(systemName: "questionmark.square.dashed")
                            .font(.largeTitle)
                        Text("Cart is empty.")
                        Text("Please add your products!")
                    }
                }
                
                List {
                    ForEach(cartStore.products) { product in
                        HStack {
                            AsyncImage(url: product.imageURL) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150)
                            } placeholder: {
                                ProgressView()
                            }
                            
                            VStack(alignment: .leading) {
                                Text("\(product.name)")
                                    .font(.headline)
                                Text("\(product.priceString)")
                            }
                            
                            Spacer()
                            
                            Button("Buy") {
                                shopURL = product.shopURL
                                isShowingShop.toggle()
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                    .onDelete { offsets in
                        cartStore.removeProducts(at: offsets)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Cart")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        isShowingAdding.toggle()
                    }
                }
            }
            .sheet(isPresented: $isShowingAdding) {
                AddingProductView(cartStore: cartStore, isShowingAdding: $isShowingAdding)
            }
            .sheet(isPresented: $isShowingShop) {
                SafariView(url: $shopURL)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
