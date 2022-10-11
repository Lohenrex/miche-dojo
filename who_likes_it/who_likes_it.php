<?
function likes($names) {
  $likeCount = sizeof($names);
  $likedByText = "";

  switch ($likeCount) {
    case 0:
      $likedByText = "no one likes this";
      break;

    case 1:
      $likedByText = "{$names[0]} likes this";
      break;

    case 2:
      $likedByText = "{$names[0]} and {$names[1]} like this";
      break;

    case 3:
      $likedByText = "{$names[0]}, {$names[1]} and {$names[2]} like this";
      break;

    default:
      $othersCount = $likeCount - 2;
      $likedByText = "{$names[0]}, {$names[1]} and {$othersCount} others like this";
      break;
  }

  return $likedByText;
}


?>
