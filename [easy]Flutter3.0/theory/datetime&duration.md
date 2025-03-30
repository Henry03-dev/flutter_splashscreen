DateTime은 날짜를 표현하는 클래스고
Duration은 기간을 표현하는 클래스다.

DateTime 기본 사용법

void main() {
    final date = DateTime(
        /// 년
        1992,
        /// 월
        11,
        /// 일
        23,
        /// 시
        1,
        /// 분
        23,
        /// 초
        25,
        /// 밀리초
        30,
        /// 마이크로 초
        5,
    );
}

- 순서대로 입력, 년도만 필수입력 나머지는 옵셔널
- 옵셔널 값을 입력 안할경우 월, 일은 기본값이 1로 입력되고 나머지는 0이 입력

- .utc 생성자를 사용하면 utc 기준으로 날짜 시간을 생성할 수 있다.
DateTime.utc();
- 따라서 utc로 표현하게 되면 입력값에 9시간이 줄어들게 된다.
- utc로 타임존 설정이 많이 사용된다.

- .now() 생성자는 코드가 실행되는 시간의 현재 날짜를 구함
DateTime.now()

Duration 기본 사용법

void main() {
    final duration = Duration(
        /// 날
        days: 1,
        /// 시
        hours: 1,
        /// 분
        minutes: 1,
        /// 초
        seconds: 1,
        /// 밀리 초
        milliseconds: 1,
        /// 마이크로 초
        microseconds: 1,
    );
}

- 값을 입력하지 않으면 모든 값은 0으로 초기화

DateTime.add() / DateTime.subtract()

void main() {
    final date = DateTime(
        1992,
        11,
        23,
    );

    final duration = Duration(
        days: 1,
    )

    /// 1992-11-24 00:00:00.000
    print(date.add(duration));
    /// 1992-11-22 00:00:00.000
    print(date.subtract(duration));
}

DateTime.isAfter() / DateTime.isBefore()

void main() {
    final date1 = DateTime(
        1992,
        11,
        23,
    );

    final date2 = DateTime(
        2023,
        11,
        23,
    );

    /// false
    print(date1.isAfter(date2));
    /// true
    print(date1.isBefore(date2));
    // false
    print(date1.isAtSameMomentAs(date2));
}

void main() {
    final date = DateTime(
        1992,
        11,
        23,
    );

    final utcDate = date.toUtc();

    /// 1992-11-23 00:00:00.000
    print(date);
    /// 1992-11-22 15:00:00.000Z
    print(utcDate);
    /// 1992-11-23 00:00:00.000
    print(utcDate.toLocal());
}

- toUtc() 함수는 현지 날짜를 UTC 기준 날짜로 변경(끝에 Z는 UTC표시)
- toLocal() 함수는 UTC 기준 날짜를 현지 날짜로 변경