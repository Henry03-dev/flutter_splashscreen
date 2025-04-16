theory
- SringSplit

final numbers1 = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
];

final numbers2 = [
    123,
    456,
    789,
];

생성한 난수가 저장되어 있는 numbers2 리스트를 위젯으로 사용할 수 있는 numbers1  형태로 만드는데 StringSplit을 사용한다.

ex)

print('123'.split(''));

split에 공백을 두면 한글자 단위로 나눔

final numbers3 = numbers2
    .map(
        (e) => e.toString().split(
            '',
            ),
        ).toList();