<?php use Jazz\TestGuy;

$I = new TestGuy($scenario);
$I->wantTo('weiXin that jazz musicians can add numbers');
$I->seeEquals(10, Jazz\Musician::add(3, 7));
