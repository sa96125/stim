//
//  MypageView.swift
//  stim
//
//  Created by chaplin on 2022/10/07.
//

import SwiftUI
import UIKit

struct MyPageView: View {
    
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {
        NavigationView {
            List {
                
                Section {
                    Text("계정 설정")
                    Text("구독 및 해지")
                } footer: {
                    Text("개인 정보 및 결제를 관리합니다.")
                        .font(.caption2)
                }
                
                
                Section {
                    Text("프로필 관리")
                    Text("내 게시물")
                    Text("북마크")
                } footer: {
                    Text("계정의 활동 내역을 확인하고 업로드 할 수 있습니다.")
                        .font(.caption2)
                }
                
                
                Section {
                    Text("소식")
                    Text("고객 문의")
                    Text("알림 설정")
                } footer: {
                    Text("스팀의 새로운 소식, 개선된 기능을 확인해보세요.")
                        .font(.caption2)
                }
                
                
                Section {
                    Text("로그아웃")
                        .onTapGesture {
                            authViewModel.logout()
                        }
                }
                .foregroundColor(.red)
                
                
            }
            .font(.subheadline)
            .navigationBarTitle("내 정보")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .navigationBarTrailing) {
                Button {
                    print("message button clicked")
                } label: {
                    Image(systemName: "paperplane")
                        .foregroundColor(.black)
                        .font(.subheadline)
                }
            }
        }
        }
    }
}

extension MyPageView {
    
    enum Options: Int, CaseIterable {
        case account
        case profile
        case bookmarks
        case subscribe
        case customer
        case notice
        case notification
        case logout
        
        var title: String {
            switch self {
            case .profile: return "프로필 관리"
            case .account: return "계정 정보"
            case .bookmarks: return "북마크"
            case .subscribe: return "구독 정보 및 해지"
            case .notice: return "공지사항"
            case .customer: return "고객 문의"
            case .notification: return "알림 설정"
            case .logout: return "로그아웃"
            }
        }
    }
    
}
