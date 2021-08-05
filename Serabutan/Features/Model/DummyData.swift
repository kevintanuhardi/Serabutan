//
//  DummyData.swift
//  Serabutan
//
//  Created by Yahya Ayyash on 01/08/21.
//

import Foundation
import UIKit
import MapKit

class DummyData {
    static let shared = DummyData()
    
    private var jobsList = [Jobs]()
    private var userProfile = [UserProfile]()
    private var profileStatistic = [ProfileStatistic]()
    private var userReview = [Review]()
    
    init(){
    }
    
    private func seedJobsList() {
        // Active Jobs
        jobsList.append(Jobs(id: 0,
                           jobPosterId: userProfile[0],
                           postingDate: Date(timeInterval: -(60)*5, since: Date()),
                           urgency: .low,
                           title: "Mencabut Rumput Liar dan Merapikan Taman di Depan Rumah",
                           desc: "Taman rumah saya terlihat jelek karena terlalu banyak rumput liar. Perlu dicabutin & dipotong rumputnya agar rapi.",
                           price: 150_000,
                           status: .active,
                           distance: 100.0,
                           coordinate: CLLocationCoordinate2D(latitude: -6.2955619, longitude: 106.6423707),
                           tags: ["taman", "rumput", "rapiin", "potong"],
                           medias: [UIImage(named: "taman-0")!, UIImage(named: "taman-1")!, UIImage(named: "taman-2")!],
                           helperId: nil,
                           genderPreference: nil,
                           agePreference: nil))
        jobsList.append(Jobs(id: 1,
                           jobPosterId: userProfile[1],
                           postingDate: Date(timeInterval: -(60)*10, since: Date()),
                           urgency: .medium,
                           title: "Bantu Sebar Kotak Syukuran",
                           desc: "Anak pertama kami baru saja lahir. Kami ingin membagi kebahagiaan kami dengan orang-orang sekitar. Kami butuh satu orang yang dapat membantu membagi-bagikan kotak makanan pada warga komplek. Diutamakan memiliki motor.",
                           price: 100_000,
                           status: .active,
                           distance: 125.0,
                           coordinate: CLLocationCoordinate2D(latitude: -6.2941563, longitude: 106.6420227),
                           tags: ["keliling", "mobilitas", "motor", "tetangga", "syukuran"],
                           medias: [UIImage(named: "syukuran-0")!, UIImage(named: "syukuran-1")!, UIImage(named: "syukuran-2")!],
                           helperId: nil,
                           genderPreference: nil,
                           agePreference: nil))
        jobsList.append(Jobs(id: 2,
                           jobPosterId: userProfile[2],
                           postingDate: Date(timeInterval: -(60)*15, since: Date()),
                           urgency: .high,
                           title: "Bantuin Masak Opor Lebaran",
                           desc: "Keluarga besar saya dadakan memutuskan untuk kumpul lebaran di rumah saya. Saya kurang bisa masak dan butuh orang buat bantu-bantu masak (semua bahan akan disediakan). Masakan yang kira-kira akan dimasak: opor, sambal ati, rendang. Rencana akan membuat 100 porsi masing-masing masakan, sehingga butuh tenaga yang kuat. Pekerjaan diharapkan jadi dalam sehari sehingga makanannya segar. Diharapkan terbiasa menggunakan bumbu sendiri tanpa MSG.",
                           price: 300_000,
                           status: .active,
                           distance: 150.0,
                           coordinate: CLLocationCoordinate2D(latitude: -6.2898567, longitude: 106.6377652),
                           tags: ["masak", "opor", "rendang", "lebaran"],
                           medias: [UIImage(named: "opor-0")!, UIImage(named: "opor-1")!, UIImage(named: "opor-2")!],
                           helperId: nil,
                           genderPreference: nil,
                           agePreference: nil))
        jobsList.append(Jobs(id: 3,
                           jobPosterId: userProfile[3],
                           postingDate: Date(timeInterval: -(60)*20, since: Date()),
                           urgency: .high,
                           title: "Nurunin Kucing dari Atap",
                           desc: "Dibutuhkan orang yang berani memanjat atap tinggi sekitar 4 meter. Diutamakan yang memiliki tangga untuk memanjat (di rumah tidak ada tangga). Seceptanya mumpung kucing masih tiduran di tempat yang sama semenjak 20 menit lalu sepertinya takut untuk turun.",
                           price: 100_000,
                           status: .active,
                           distance: 160.0,
                           coordinate: CLLocationCoordinate2D(latitude: -6.2931612, longitude: 106.6376594),
                           tags: ["kucing", "terjebak", "hewan", "atap", "ketinggian", "catlovers" , "bantu", "pencintahewan"],
                           medias: [UIImage(named: "kucing-0")!, UIImage(named: "kucing-1")!, UIImage(named: "kucing-2")!, UIImage(named: "kucing-3")!],
                           helperId: nil,
                           genderPreference: nil,
                           agePreference: nil))
        jobsList.append(Jobs(id: 4,
                           jobPosterId: userProfile[4],
                           postingDate: Date(timeInterval: -(60)*25, since: Date()),
                           urgency: .medium,
                           title: "Bantuin Dekorasi Ulang Tahun Anak Tema Spongebob Squarepants",
                           desc: "Anak saya ulang tahun yang ke empat 3 hari lagi. Dekornya cukup banyak karena saya dan suami ke kantor tiap hari. Butuh bantuan orang yang pernah ngedekor acara-acara, semua peralatan akan disediakan.",
                           price: 300_000,
                           status: .active,
                           distance: 250.0,
                           coordinate: CLLocationCoordinate2D(latitude: -6.2979747, longitude: 106.6371065),
                           tags: ["keliling", "mobilitas", "motor", "tetangga", "syukuran"],
                           medias: [UIImage(named: "ultah-0")!, UIImage(named: "ultah-1")!, UIImage(named: "ultah-2")!],
                           helperId: nil,
                           genderPreference: nil,
                           agePreference: nil))
        
        // Ongoing Jobs
        jobsList.append(Jobs(id: 5,
                           jobPosterId: userProfile[3],
                           postingDate: Date(timeInterval: -(60)*5, since: Date()),
                           urgency: .medium,
                           title: "Mencabut Rumput Liar dan Merapikan Taman di Depan Rumah",
                           desc: "Taman rumah saya terlihat jelek karena terlalu banyak rumput liar. Perlu dicabutin & dipotong rumputnya agar rapi.",
                           price: 150_000,
                           status: .taken,
                           distance: 100.0,
                           coordinate: CLLocationCoordinate2D(latitude: -6.2955619, longitude: 106.6423707),
                           tags: ["taman", "rumput", "rapiin", "potong"],
                           medias: [UIImage(named: "taman-0")!, UIImage(named: "taman-1")!, UIImage(named: "taman-2")!],
                           helperId: userProfile[0],
                           genderPreference: nil,
                           agePreference: nil))
        jobsList.append(Jobs(id: 6,
                           jobPosterId: userProfile[0],
                           postingDate: Date(timeInterval: -(60)*10, since: Date()),
                           urgency: .medium,
                           title: "Bantu Sebar Kotak Syukuran",
                           desc: "Anak pertama kami baru saja lahir. Kami ingin membagi kebahagiaan kami dengan orang-orang sekitar. Kami butuh satu orang yang dapat membantu membagi-bagikan kotak makanan pada warga komplek. Diutamakan memiliki motor.",
                           price: 100_000,
                           status: .taken,
                           distance: 125.0,
                           coordinate: CLLocationCoordinate2D(latitude: -6.2941563, longitude: 106.6420227),
                           tags: ["keliling", "mobilitas", "motor", "tetangga", "syukuran"],
                           medias: [UIImage(named: "syukuran-0")!, UIImage(named: "syukuran-1")!, UIImage(named: "syukuran-2")!],
                           helperId: userProfile[2],
                           genderPreference: nil,
                           agePreference: nil))
        jobsList.append(Jobs(id: 7,
                           jobPosterId: userProfile[0],
                           postingDate: Date(timeInterval: -(60)*15, since: Date()),
                           urgency: .high,
                           title: "Bantuin Masak Opor Lebaran",
                           desc: "Keluarga besar saya dadakan memutuskan untuk kumpul lebaran di rumah saya. Saya kurang bisa masak dan butuh orang buat bantu-bantu masak (semua bahan akan disediakan). Masakan yang kira-kira akan dimasak: opor, sambal ati, rendang. Rencana akan membuat 100 porsi masing-masing masakan, sehingga butuh tenaga yang kuat. Pekerjaan diharapkan jadi dalam sehari sehingga makanannya segar. Diharapkan terbiasa menggunakan bumbu sendiri tanpa MSG.",
                           price: 300_000,
                           status: .taken,
                           distance: 150.0,
                           coordinate: CLLocationCoordinate2D(latitude: -6.2898567, longitude: 106.6377652),
                           tags: ["masak", "opor", "rendang", "lebaran"],
                           medias: [UIImage(named: "opor-0")!, UIImage(named: "opor-1")!, UIImage(named: "opor-2")!],
                           helperId: userProfile[1],
                           genderPreference: nil,
                           agePreference: nil))
        
        // Inactive Jobs
        jobsList.append(Jobs(id: 8,
                           jobPosterId: userProfile[3],
                           postingDate: Date(timeInterval: -(60)*20, since: Date()),
                           urgency: .high,
                           title: "Nurunin Kucing dari Atap",
                           desc: "Dibutuhkan orang yang berani memanjat atap tinggi sekitar 4 meter. Diutamakan yang memiliki tangga untuk memanjat (di rumah tidak ada tangga). Seceptanya mumpung kucing masih tiduran di tempat yang sama semenjak 20 menit lalu sepertinya takut untuk turun.",
                           price: 100_000,
                           status: .done,
                           distance: 160.0,
                           coordinate: CLLocationCoordinate2D(latitude: -6.2931612, longitude: 106.6376594),
                           tags: ["kucing", "terjebak", "hewan", "atap", "ketinggian", "catlovers" , "bantu", "pencintahewan"],
                           medias: [UIImage(named: "kucing-0")!, UIImage(named: "kucing-1")!, UIImage(named: "kucing-2")!, UIImage(named: "kucing-3")!],
                           helperId: userProfile[0],
                           genderPreference: nil,
                           agePreference: nil))
        jobsList.append(Jobs(id: 9,
                           jobPosterId: userProfile[0],
                           postingDate: Date(timeInterval: -(60)*25, since: Date()),
                           urgency: .medium,
                           title: "Bantuin Dekorasi Ulang Tahun Anak Tema Spongebob Squarepants",
                           desc: "Anak saya ulang tahun yang ke empat 3 hari lagi. Dekornya cukup banyak karena saya dan suami ke kantor tiap hari. Butuh bantuan orang yang pernah ngedekor acara-acara, semua peralatan akan disediakan.",
                           price: 300_000,
                           status: .done,
                           distance: 250.0,
                           coordinate: CLLocationCoordinate2D(latitude: -6.2979747, longitude: 106.6371065),
                           tags: ["keliling", "mobilitas", "motor", "tetangga", "syukuran"],
                           medias: [UIImage(named: "ultah-0")!, UIImage(named: "ultah-1")!, UIImage(named: "ultah-2")!],
                           helperId: userProfile[4],
                           genderPreference: nil,
                           agePreference: nil))
    }
    
    private func seedUserProfile() {
        userProfile.append(UserProfile(name: "Agus Susanto",
                                       avatar: UIImage(named: "avatar-0"),
                                       bio: "Suka bantu-bantu orang, bisa apa saja. Pernah kerja di bengkel sepeda dan motor, jadi lumayan tahu tentang otomotif.",
                                       joinDate: Date(timeInterval: -(60*60*24)*10, since: Date()),
                                       isVerified: true,
                                       statistics: profileStatistic[0]))
        userProfile.append(UserProfile(name: "Susi Susanti",
                                       avatar: UIImage(named: "avatar-1"),
                                       bio: "Suka bantuin tugas-tugas rumah dan taman.",
                                       joinDate: Date(timeInterval: -(60*60*24)*15, since: Date()),
                                       isVerified: true,
                                       statistics: profileStatistic[1]))
        userProfile.append(UserProfile(name: "Tono Wiyarto",
                                       avatar: UIImage(named: "avatar-2"),
                                       bio: "Sehari-hari driver ojek online tapi terbuka untuk membantu orang sekitar. Bisa bantu urusan nganter-nganter, dll.",
                                       joinDate: Date(timeInterval: -(60*60*24)*35, since: Date()),
                                       isVerified: false,
                                       statistics: profileStatistic[2]))
        userProfile.append(UserProfile(name: "Ida Kusuma",
                                       avatar: UIImage(named: "avatar-3"),
                                       bio: "Terbiasa memasak, bisa bantu-bantu kalau lebaran atau ada syukuran yang butuh tenaga masak.",
                                       joinDate: Date(timeInterval: -(60*60*24)*20, since: Date()),
                                       isVerified: true,
                                       statistics: profileStatistic[3]))
        userProfile.append(UserProfile(name: "Dodi Sujarwo",
                                       avatar: UIImage(named: "avatar-4"),
                                       bio: "Mahasiswa biasa saja yang mencari tambahan di sela-sela waktu. Bisa bantu apa saja asal pekerjaannya tidak susah dan spesifik.",
                                       joinDate: Date(timeInterval: -(60*60*24)*9, since: Date()),
                                       isVerified: false,
                                       statistics: profileStatistic[4]))
        userProfile.append(UserProfile(name: "Dhea Aninda",
                                       avatar: UIImage(named: "avatar-5"),
                                       bio: "Baru lulus kuliah jadi banyak waktu luang. Suka hal-hal berbau seni. Berpengalaman dekor acara-acara di kampus, tapi bisa bantu apa aja asal ga berat-berat.",
                                       joinDate: Date(timeInterval: -(60*60*24)*11, since: Date()),
                                       isVerified: false,
                                       statistics: profileStatistic[5]))
    }
    
    private func seedProfileStatistic() {
        profileStatistic.append(ProfileStatistic(reviewAggregate: 4.8, totalReview: 30, dibantu: 15, membantu: 15))
        profileStatistic.append(ProfileStatistic(reviewAggregate: 4.0, totalReview: 10, dibantu: 10, membantu: 0))
        profileStatistic.append(ProfileStatistic(reviewAggregate: 4.5, totalReview: 5, dibantu: 0, membantu: 5))
        profileStatistic.append(ProfileStatistic(reviewAggregate: 4.2, totalReview: 2, dibantu: 2, membantu: 0))
        profileStatistic.append(ProfileStatistic(reviewAggregate: 4.9, totalReview: 10, dibantu: 6, membantu: 4))
        profileStatistic.append(ProfileStatistic(reviewAggregate: 5.0, totalReview: 4, dibantu: 4, membantu: 0))
    }
    
    private func seedUserReview() {
        userReview.append(Review(jobTitle: "Ban Sepeda Bocor di Jalan",
                                 finishedDate: Date(timeInterval: -(60*60*24), since: Date()),
                                 reviewPoint: 4,
                                 reviewText: "Pak Agus datang dengan cepat saat ban sepeda saya bocor. Alat-alatnya lengkap, sukses terus Pak Agus!",
                                 reviewer: userProfile[2]))
        userReview.append(Review(jobTitle: "Merapikan Rumput Liar",
                                 finishedDate: Date(timeInterval: -(60*60*24)*3, since: Date()),
                                 reviewPoint: 5,
                                 reviewText: "Potongan rumput Bu Susi sangat rapi, taman saya menjadi cantik.",
                                 reviewer: userProfile[3]))
        userReview.append(Review(jobTitle: "Bantu Sebar Kotak Syukuran",
                                 finishedDate: Date(timeInterval: -(60*60*24)*5, since: Date()),
                                 reviewPoint: 3,
                                 reviewText: "Pak Tono sangat terpercaya untuk nganter berbagai macam barang. Kemarin saya butuh bantuan untuk menyebarkan kotak syukuran ke tetangga sekitar, Pak Tono gesit dan aktif sekali dalam menyebarkan, jika ada kurang apa-apa ia segera inisiatif bertanya. Pak Tono juga fleksibel orangnya dan tidak rewel, semangat bekerja walaupun matahari menyengat. Semangat terus Pak Tono!",
                                 reviewer: userProfile[4]))
        userReview.append(Review(jobTitle: "Bantuin Masak Opor Lebaran",
                                 finishedDate: Date(timeInterval: -(60*60*24)*10, since: Date()),
                                 reviewPoint: 4,
                                 reviewText: "Masakan Bu Ida enak dan cara masaknya sangat higienis. Sukses terus Bu Ida.",
                                 reviewer: userProfile[0]))
        userReview.append(Review(jobTitle: "Nurunin Kucing dari Atap",
                                 finishedDate: Date(timeInterval: -(60*60*24)*15, since: Date()),
                                 reviewPoint: 5,
                                 reviewText: "Mas Dodi gercep datang menyelamatkan kucing saya. Terima kasih Mas Dodi. Mas Dodi ternyata juga pecinta hewan jadi kucing yang diselamatkan tidak takut. Setelah ngobrol-ngobrol dengan Mas Dodi ia juga mengerti sedikit tentang pertukangan, sehingga kalau mau ada atap bocor bisa minta dia juga. Semangat kuliahnya Mas Dodi!",
                                 reviewer: userProfile[1]))
        userReview.append(Review(jobTitle: "Bantuin Dekor Ultah Anak",
                                 finishedDate: Date(timeInterval: -(60*60*24)*16, since: Date()),
                                 reviewPoint: 4,
                                 reviewText: "Mba Dhea baik banget dan kerjaannya rapi dan bagus!",
                                 reviewer: userProfile[2]))
    }
    
    func seedData() {
        seedProfileStatistic()
        seedUserProfile()
        seedUserReview()
        seedJobsList()
    }
    
    func getJobsList() -> [Jobs] {
        return jobsList
    }
    
    func getUserProfile() -> [UserProfile] {
        return userProfile
    }
    
    func getProfileStatistic() -> [ProfileStatistic] {
        return profileStatistic
    }
    
    func getUserReview() -> [Review] {
        return userReview
    }
    
}
